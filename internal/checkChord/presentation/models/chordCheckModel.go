package models

import "Harmony-Tune/internal/checkChord/domain/model"

type ChordCheckRequest struct {
	NoteNumberList []int  `json:"noteNumberList"`
	KeySignature   string `json:"key"`
	ScaleType      string `json:"scaleType"`
}

type ChordCheckResponse struct {
	ChordList []model.Chord `json:"chordList"`
}
