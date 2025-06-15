package model

type ChordCheckResponse struct {
	ChordWithInScaleArray  []Chord `json:"chordWithInScaleArray"`
	ChordWithoutScaleArray []Chord `json:"chordWithoutScaleArray"`
}
