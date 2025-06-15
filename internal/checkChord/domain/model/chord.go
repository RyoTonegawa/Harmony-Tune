package model

type Chord struct {
	ChordRootNote  string      `json:"chordRootNote"`
	ChordType      string      `json:"chordType"`
	ChordToneArray []ChordTone `json:"chordToneArray"`
}
