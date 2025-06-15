package models

import "Harmony-Tune/internal/checkChord/domain/model"

type ChordCheckRequest struct {
	NoteNumberArray []int  `json:"noteNumberArray"`
	KeySignature    string `json:"key"`
	ScaleType       string `json:"scaleType"`
}

type ChordCheckResponse struct {
	ChordWithInScaleArray  []model.Chord `json:"chordWithInScaleArray"`
	ChordWithoutScaleArray []model.Chord `json:"chordWithoutScaleArray"`
}
