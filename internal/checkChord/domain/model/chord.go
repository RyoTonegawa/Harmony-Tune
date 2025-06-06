package model

type Chord struct {
	// コードの名前
	ChordName string `json:"chordName"`
	// I Majorとか 本来スケール単位の情報なのでここではない
	ChordNameInScale string `json:"rootNoteName"`
	NoteArray        []Note `json:"noteArray"`
}
