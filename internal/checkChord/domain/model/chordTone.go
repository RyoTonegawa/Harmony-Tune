package model

type ChordTone struct {
	LetterName string `json:"letterName"`
	Degree     Degree `json:"degree"`
}
