package models

import "Harmony-Tune/internal/checkChord/domain/model"

type ChordCheckRequest struct {
	NoteNumberList []int `json:"noteNumberList"`
	KeySignature   int   `json:"key"`
}

type ChordCheckResponse struct {
	ChordList []model.Chord `json:"chordList"`
}
