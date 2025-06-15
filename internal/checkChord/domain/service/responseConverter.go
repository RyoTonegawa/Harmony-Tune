package service

import (
	"Harmony-Tune/internal/checkChord/domain/model"
)

type ResponseConverter struct {
	scaleSvc ScaleServiceInterface
}
type ResponseConverterInterface interface {
	Convert([]model.Chord, []string) (model.ChordCheckResponse, error)
}

var _ ResponseConverterInterface = (*ResponseConverter)(nil)

func NewResponseConverter(
	scaleSvc ScaleServiceInterface,
) *ResponseConverter {
	return &ResponseConverter{
		scaleSvc: scaleSvc,
	}
}
func (r *ResponseConverter) Convert(
	chords []model.Chord,
	scaleTones []string,
) (
	model.ChordCheckResponse, error,
) {

	withinScale := make([]model.Chord, 0)
	withoutScale := make([]model.Chord, 0)
	for _, eachChord := range chords {
		//ScaleSvcのメソッドにアクセスできない
		if r.scaleSvc.IsChordWithInScale(
			&eachChord,
			scaleTones,
		) {
			//TrueならResponseのChordWithInScaleArray
			withinScale = append(withinScale, eachChord)
		} else {
			// falseならChordWithoutScaleArray
			withoutScale = append(withoutScale, eachChord)

		}
	}
	response := model.ChordCheckResponse{
		ChordWithInScaleArray:  withinScale,
		ChordWithoutScaleArray: withoutScale,
	}
	return response, nil
}
