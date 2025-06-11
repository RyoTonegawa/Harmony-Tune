package service

import (
	"Harmony-Tune/internal/checkChord/domain/model"
	"Harmony-Tune/supabase"
)

type ChordCheckService struct{}

func NewChordCheckService() *ChordCheckService {
	return &ChordCheckService{}
}

func (s *ChordCheckService) DetermineChord(
	letterNameList []string,
	saleTones []string,
) (model.Chord, error) {

	supabase.GetChordMastersByExactTones(
		letterNameList,
	)
	return model.Chord{
		ChordName: "C",
		ChordType: "Major",
		NoteArray: []model.Note{
			{
				LetterName:    "C",
				DegreeInChord: "root",
			},
		},
	}, nil
}
