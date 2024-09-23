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
