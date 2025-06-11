package service

import (
	"Harmony-Tune/supabase"
)

type ScaleService struct {
}

func NewScaleService() *ScaleService {
	return &ScaleService{}
}

func (s *ScaleService) GetScaleTones(
	keySignature string,
	scaleType string,
) ([]string, error) {
	return supabase.GetScaleNotesByKeyAndName(keySignature, scaleType)
}
