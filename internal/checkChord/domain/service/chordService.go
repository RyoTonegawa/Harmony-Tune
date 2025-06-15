package service

import (
	"Harmony-Tune/infrastructure/supabase"
	"Harmony-Tune/internal/checkChord/domain/model"
)

type ChordServiceInterface interface {
	DetermineChord([]string, []string) ([]model.Chord, error)
}

var _ ChordServiceInterface = (*ChordService)(nil)

type ChordService struct{}

func NewChordService() *ChordService {
	return &ChordService{}
}

func (s *ChordService) DetermineChord(
	letterNameArray []string,
	saleTones []string,
) ([]model.Chord, error) {
	var chordMasterRepository = supabase.NewSupabaseChordMasterRepository()
	return chordMasterRepository.GetChordMastersByExactTones(
		letterNameArray,
	)
}
