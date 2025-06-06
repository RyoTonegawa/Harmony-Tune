package service

import (
	"Harmony-Tune/internal/checkChord/domain/model"
)

type ChordCheckService struct{}

func NewChordCheckService() *ChordCheckService {
	return &ChordCheckService{}
}

func (s *ChordCheckService) DetermineChord(
	noteNumberList []int,
	KeySignature int,
) (model.Chord, error) {
	return model.Chord{
		ChordName:    []string{"C"},
		KeySignature: "C",
	}, nil
}
