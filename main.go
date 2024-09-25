package main

import (
	"database/sql"
	"encoding/json"
	"fmt"
	"log"
	"net/http"
	"os"

	"bytes"

	"github.com/go-chi/chi/v5"
	"github.com/go-chi/chi/v5/middleware"
	"github.com/go-chi/jwtauth/v5"
	"github.com/joho/godotenv"

	//"net/http"

	"profile/models"

	_ "github.com/go-sql-driver/mysql"
	"golang.org/x/crypto/bcrypt"

	"strconv"
)

/*
 * We compare the hashed password in DB with the password entered by user
 */
func checkPassword(hashPassword, password string) bool {
	err := bcrypt.CompareHashAndPassword([]byte(hashPassword), []byte(password))
	return err == nil
}

/*
 * We parse the request body, fetch user details based on email entered,
 * check the hashed password with user's entered password
 * generate claims and create token and return it in response
 */

type ErrorMessage struct {
	Status  int
	Message string
}

func (server *Server) LoginUser(w http.ResponseWriter, r *http.Request) {
	userReqBody := new(models.UserRequestBody)
	if err := json.NewDecoder(r.Body).Decode(userReqBody); err != nil {
		w.Header().Set("Content-Type", "application/json")
		errorMessage := ErrorMessage{
			Status:  http.StatusBadRequest,
			Message: "Please Provide Correct Input",
		}

		var buffer bytes.Buffer
		json.NewEncoder(&buffer).Encode(&errorMessage)
		return
	}
	query := `SELECT profile_id, msisdn, hash, network FROM profile where msisdn = ?`
	rows, err := server.DB.Query(query, userReqBody.Msisdn)
	if err != nil {
		w.Header().Set("Content-Type", "application/json")
		errorMessage := ErrorMessage{
			Status:  http.StatusBadRequest,
			Message: "Please Provide Correct User and Password",
		}
		json.NewEncoder(w).Encode(&errorMessage)

		return
	}
	var user *models.User
	for rows.Next() {
		user, err = models.ScanRow(rows)
		if err != nil {
			w.Header().Set("Content-Type", "application/json")
			errorMessage := ErrorMessage{
				Status:  http.StatusBadRequest,
				Message: "Failed to find User. Server Error",
			}
			json.NewEncoder(w).Encode(&errorMessage)
			return
		}
	}

	if !checkPassword(user.Hash, userReqBody.Password) {

		w.Header().Set("Content-Type", "application/json")
		errorMessage := ErrorMessage{
			Status:  http.StatusBadRequest,
			Message: "Please Provide Correct Input",
		}
		json.NewEncoder(w).Encode(&errorMessage)

		return
	}

	/* After verify password, we want to generate user specific token
	 * for that we mask few of the user details in the jwt token
	 * these are called as claims and are used for verifying user w.r.t token
	 */
	claims := map[string]interface{}{"profile_id": user.Id, "msisdn": user.Msisdn}
	_, tokenString, err := server.AuthToken.Encode(claims)
	if err != nil {

		w.Header().Set("Content-Type", "application/json")
		errorMessage := ErrorMessage{
			Status:  http.StatusInternalServerError,
			Message: "Could not Generate Token",
		}
		json.NewEncoder(w).Encode(&errorMessage)

		return
	}

	w.Header().Set("Content-Type", "application/json")
	loginResponse := LoginResponse{
		User: User{
			Id:      user.Id,
			Mobile:  user.Msisdn,
			Profile: user.Id,
			Balance: 1,
			Bonus:   1,
			Points:  1,
			Token:   tokenString,
			Expires: 1,
		},
		Expires: 1,
	}

	json.NewEncoder(w).Encode(loginResponse)
}

type LoginResponse struct {
	User struct {
		Id      int
		Mobile  string
		Profile int
		Balance int
		Bonus   int
		Points  int
		Token   string
		Expires int
	}
	Expires int
}
type User struct {
	Id      int
	Mobile  string
	Profile int
	Balance int
	Bonus   int
	Points  int
	Token   string
	Expires int
}

/*
 * We pass user's password into this function and
 * call bcrypts function to give us the hashed password
 */
func getHashPassword(password string) (string, error) {
	bytePassword := []byte(password)
	hash, err := bcrypt.GenerateFromPassword(bytePassword, bcrypt.DefaultCost)
	if err != nil {
		return "", err
	}
	return string(hash), nil
}

/*
 * We parse the user request body, takes the email, password
 * hashes the password and then runs insert query to insert in DB
 * on success returns the Id of the record
 */
func (server *Server) CreateUser(w http.ResponseWriter, r *http.Request) {
	userReqBody := new(models.UserRequestBody)
	if err := json.NewDecoder(r.Body).Decode(userReqBody); err != nil {

		w.Header().Set("Content-Type", "application/json")
		errorMessage := ErrorMessage{
			Status:  http.StatusBadRequest,
			Message: "Please Provide Correct Input",
		}
		json.NewEncoder(w).Encode(&errorMessage)
		return
	}

	hashPassword, err := getHashPassword(userReqBody.Password)
	if err != nil {

		w.Header().Set("Content-Type", "application/json")
		errorMessage := ErrorMessage{
			Status:  http.StatusBadRequest,
			Message: "Incorrect Password Format",
		}
		json.NewEncoder(w).Encode(&errorMessage)

		return
	}

	query := `INSERT INTO profile (msisdn, hash, network) VALUES (?, ?, ?)`
	result, err := server.DB.Exec(query, userReqBody.Msisdn, hashPassword, userReqBody.Network)
	if err != nil {

		w.Header().Set("Content-Type", "application/json")
		errorMessage := ErrorMessage{
			Status:  http.StatusBadRequest,
			Message: "User Already Exists or Wrong input Format",
		}
		json.NewEncoder(w).Encode(&errorMessage)
		return
	}
	recordId, _ := result.LastInsertId()

	w.Header().Set("Content-Type", "application/json")
	userCreatedResponse := UserCreatedResponse{
		ProfileId: int(recordId),
		Status:    http.StatusOK,
		Mobile:    userReqBody.Msisdn,
		Message:   "User Created",
	}

	json.NewEncoder(w).Encode(&userCreatedResponse)

}

type UserCreatedResponse struct {
	ProfileId int
	Status    int
	Mobile    string
	Message   string
}

/* This GET /user/{profile_id} will require the JWT token
 * generated from POST /user/login in auth headers
 */
func (server *Server) GetUser(w http.ResponseWriter, r *http.Request) {

	// We get the 'profile_id' from URL parameters of the request
	id := chi.URLParam(r, "profile_id")
	userId, err := strconv.Atoi(id)

	if err != nil {

		w.Header().Set("Content-Type", "application/json")
		errorMessage := ErrorMessage{
			Status:  http.StatusBadRequest,
			Message: "Could not find User. Provide Correct Input",
		}
		json.NewEncoder(w).Encode(&errorMessage)

		return
	}

	/* After the Verifier and Authenticator have successful validated this request
	 * We destructure the claims from the request and get the userId from claims
	 * We then check whether the userId from claims is same as the userId for which
	 * the request has been hit (from url params), if not that means user is using
	 * different JWT token and hence unauthorized.
	 */
	_, claims, _ := jwtauth.FromContext(r.Context())
	userIdFromClaims := int(claims["profile_id"].(float64))

	if userId != userIdFromClaims {

		w.Header().Set("Content-Type", "application/json")
		errorMessage := ErrorMessage{
			Status:  http.StatusUnauthorized,
			Message: "You are Unauthorized to Access this page. Please Log In",
		}
		json.NewEncoder(w).Encode(&errorMessage)
		return
	}

	query := `SELECT profile_id, msisdn, hash, network FROM profile WHERE profile_id = ?`

	rows, err := server.DB.Query(query, userId)
	if err != nil {
		w.Header().Set("Content-Type", "application/json")
		errorMessage := ErrorMessage{
			Status:  http.StatusBadRequest,
			Message: "Could not find User with given Profile Id",
		}
		json.NewEncoder(w).Encode(&errorMessage)

		return
	}

	var user *models.User
	for rows.Next() {
		user, err = models.ScanRow(rows)
		if err != nil {
			w.Header().Set("Content-Type", "application/json")
			errorMessage := ErrorMessage{
				Status:  http.StatusNotFound,
				Message: "Could not find User with given User Details",
			}
			json.NewEncoder(w).Encode(&errorMessage)

			return
		}
	}
	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(http.StatusOK)
	json.NewEncoder(w).Encode(user)
}

var (
	DATABASE_URL, DB_DRIVER, JWT_SECRET_KEY, PORT string
)

/*
 *  Loads enviroment variables for .env
 */
func init() {
	err := godotenv.Load()
	if err != nil {
		log.Fatalln("Coudn't load env file!!")
	}

	DATABASE_URL = os.Getenv("DATABASE_URL_PROD")
	DB_DRIVER = os.Getenv("DB_DRIVER")
	PORT = os.Getenv("PORT")
	JWT_SECRET_KEY = os.Getenv("JWT_SECRET_KEY")
}

/*
 *  DB connection is created in this function
 */
func DBClient() (*sql.DB, error) {
	db, err := sql.Open(DB_DRIVER, DATABASE_URL)
	if err != nil {
		return nil, err
	}

	if err := db.Ping(); err != nil {
		return nil, err
	}
	fmt.Println("Connected to DB!!")
	return db, nil
}

/*
 *  This funtion returns the JWT auth structure
 *  We passed our own JWT_SECRET_KEY to generate it
 */
func GenerateAuthToken() *jwtauth.JWTAuth {
	tokenAuth := jwtauth.New("HS256", []byte(JWT_SECRET_KEY), nil)
	return tokenAuth
}

type Server struct {
	Router    *chi.Mux
	DB        *sql.DB
	AuthToken *jwtauth.JWTAuth
}

func CreateServer(db *sql.DB) *Server {
	server := &Server{
		Router:    chi.NewRouter(),
		DB:        db,
		AuthToken: GenerateAuthToken(),
	}
	return server
}

/*
 *  go-chi's middleware library provides us with different inbuilt functionality
 *  like Clean path, logger, cors etc. read here (https://go-chi.io/#/pages/middleware)
 * Here we're using Logger which will log inbound requests
 */
func (server *Server) MountMiddleware() {
	server.Router.Use(middleware.Logger)
}

/*
 * Base url: http:localhost:5000/user
 */
func (server *Server) MountHandlers() {
	server.Router.Route("/user", func(userRouter chi.Router) {

		/*  These endpoins will be accessible to user without auth
		 *  POST /user/login    =   login user
		 *  POST /user          =   create user
		 */
		userRouter.Post("/login", server.LoginUser)
		userRouter.Post("/", server.CreateUser)

		userRouter.Group(func(r chi.Router) {
			/*  We mount the Verifier and Authenticator to our request
			 *  All APIs inside this group will require JWT Token in Auth Headers
			 */
			r.Use(jwtauth.Verifier(server.AuthToken))
			r.Use(jwtauth.Authenticator)

			/*  GET /user/{id}    =   get user with specific ID
			 */
			r.Get("/{profile_id}", server.GetUser)
		})
	})
}

func main() {
	db, err := DBClient()
	if err != nil {
		log.Fatal(err)
	}

	server := CreateServer(db)
	server.MountMiddleware()
	server.MountHandlers()
	fmt.Printf("server running on port%v\n", PORT)

	http.ListenAndServe(PORT, server.Router)
}
