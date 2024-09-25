package models

import "database/sql"

type User struct {
	Id      int    `json:"profile_id"`
	Msisdn  string `json:"msisdn"`
	Hash    string `json:"hash"`
	Network string `json:"network"`
}

type UserRequestBody struct {
	Msisdn   string `json:"msisdn"`
	Password string `json:"password"`
	Network  string `json:"network"`
}

type Response struct {
	Id int `json:"profile_id"`
}

func ScanRow(rows *sql.Rows) (*User, error) {
	user := new(User)
	err := rows.Scan(&user.Id, &user.Msisdn, &user.Hash, &user.Network)
	if err != nil {
		return nil, err
	}
	return user, nil
}

// "user": {
// 	"id": "31560743",
// 	"mobile": "254702643312",
// 	"profile": "31560743",
// 	"balance": "95.28",
// 	"bonus": "5.00",
// 	"points": null,
// 	"token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9iZXRpa2EuY29tIiwiaWF0IjoxNzI3MjcxMzMwLCJuYmYiOjE3MjQ1OTI5MzAsImV4cCI6MTcyOTg2MzMzMCwidXNlciI6eyJpZCI6IjMxNTYwNzQzIiwibW9iaWxlIjoiMjU0NzAyNjQzMzEyIiwiYmFsYW5jZSI6Ijk1LjI4IiwiYm9udXMiOiI1LjAwIiwicG9pbnRzIjpudWxsfX0.P3XYIImUKyTTmfVJTq3VaBWnG2naYF8NCFz-bALMG7U",
// 	"expires": "2024-10-24T13:35:30.000Z",
// 	"user": {
// 		"id": "31560743",
// 		"mobile": "254702643312",
// 		"balance": "95.28",
// 		"bonus": "5.00",
// 		"points": null
// 	}
// },
//      "expires": "2024-10-25T13:35:31.935Z"
// }
