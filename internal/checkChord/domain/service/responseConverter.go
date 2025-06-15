package service

import (
	"Harmony-Tune/internal/checkChord/domain/model"
	"Harmony-Tune/internal/checkChord/presentation/models"
)

type ResponseConverter struct{}
type ResponseConverterInterface interface {
	Convert(chords []model.Chord) (models.ChordCheckResponse, error)
}

var _ ResponseConverterInterface = (*ResponseConverter)(nil)

func NewResponseConverter() *ResponseConverter {
	return &ResponseConverter{}
}
func (r *ResponseConverter) Convert(chords []model.Chord) (
	models.ChordCheckResponse, error,
) {
	return models.ChordCheckResponse{}, nil
}
