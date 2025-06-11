package model

type Chord struct {
	// コードの名前
	ChordName      string      `json:"chordName"`
	ChordType      string      `json:"chordType"`
	ChordToneArray []ChordTone `json:"chordToneArray"`
}
