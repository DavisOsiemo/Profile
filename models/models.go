package models

import "database/sql"

type User struct {
	Id     int    `json:"id"`
	Msisdn string `json:"msisdn"`
	Hash   string `json:"hash"`
}

type UserRequestBody struct {
	Msisdn   string `json:"msisdn"`
	Password string `json:"password"`
}

type Response struct {
	Id int `json:"id"`
}

func ScanRow(rows *sql.Rows) (*User, error) {
	user := new(User)
	err := rows.Scan(&user.Id, &user.Msisdn, &user.Hash)
	if err != nil {
		return nil, err
	}
	return user, nil
}
