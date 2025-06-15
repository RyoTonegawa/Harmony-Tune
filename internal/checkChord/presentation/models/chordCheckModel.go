package models

type ChordCheckRequest struct {
	NoteNumberArray []int  `json:"noteNumberArray" example:"60,64,67"`
	KeySignature    string `json:"key" example:"C"`
	ScaleType       string `json:"scaleType" example:"Major"`
}
