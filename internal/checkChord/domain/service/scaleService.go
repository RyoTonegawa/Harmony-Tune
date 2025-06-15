package service

import (
	"Harmony-Tune/infrastructure/supabase"
	"Harmony-Tune/internal/checkChord/domain/model"
	"errors"
	"slices"
)

type ScaleServiceInterface interface {
	GetScaleTones(keySignature, scaleType *string) ([]string, error)
	IsChordWithInScale(chord *model.Chord, scaleTones []string) bool
}

var _ ScaleServiceInterface = (*ScaleService)(nil)

type ScaleService struct{}

func NewScaleService() *ScaleService {
	return &ScaleService{}
}

func (s *ScaleService) GetScaleTones(
	keySignature *string,
	scaleType *string,
) ([]string, error) {
	// nil セーフガード
	if keySignature == nil || scaleType == nil {
		return nil, errors.New("keySignature or scaleType is nil")
	}
	return supabase.GetScaleNotesByKeyAndName(*keySignature, *scaleType)
}

func (s *ScaleService) IsChordWithInScale(
	chord *model.Chord,
	scaleToneArray []string,
) bool {
	for _, eachChordTone := range chord.ChordToneArray {
		if !slices.Contains(scaleToneArray, eachChordTone.LetterName) {
			return false
		}
	}
	return true
}
