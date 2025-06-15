package models

import "Harmony-Tune/internal/checkChord/domain/model"

type ChordCheckRequest struct {
	NoteNumberArray []int  `json:"noteNumberArray" example:"60,64,67"`
	KeySignature    string `json:"key" example:"C"`
	ScaleType       string `json:"scaleType" example:"Major"`
}

type ChordCheckResponse struct {
	ChordWithInScaleArray  []model.Chord `json:"chordWithInScaleArray"`
	ChordWithoutScaleArray []model.Chord `json:"chordWithoutScaleArray"`
}
