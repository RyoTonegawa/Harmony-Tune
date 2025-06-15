package service

import (
	"Harmony-Tune/internal/checkChord/domain/model"
	"Harmony-Tune/internal/checkChord/domain/service"
	"Harmony-Tune/internal/checkChord/presentation/models"
)

type ChordCheckServiceInterface interface {
}

type ChordCheckService struct {
	noteService       service.NoteServiceInterface
	scaleService      service.ScaleServiceInterface
	chordService      service.ChordServiceInterface
	responseConverter service.ResponseConverterInterface
}

func NewChordCheckService(
	noteSvc service.NoteServiceInterface,
	scaleSvc service.ScaleServiceInterface,
	chordSvc service.ChordServiceInterface,
	responseConverter service.ResponseConverterInterface,
) *ChordCheckService {
	return &ChordCheckService{
		noteService:       noteSvc,
		scaleService:      scaleSvc,
		chordService:      chordSvc,
		responseConverter: responseConverter,
	}
}

func (s *ChordCheckService) CheckAndTuneChord(
	req models.ChordCheckRequest,
) (model.ChordCheckResponse, error) {
	// ノートナンバーを音名に変換
	letterNameArray := s.noteService.ConvertNoteNumberToLetterName(
		req.NoteNumberArray,
	)

	// スケールの構成音を取得
	scaleTones, err := s.scaleService.GetScaleTones(
		&req.KeySignature,
		&req.ScaleType)
	if err != nil {
		return model.ChordCheckResponse{}, err
	}

	//　構成音からコードを特定
	chords, err := s.chordService.DetermineChord(
		letterNameArray,
		scaleTones,
	)
	if err != nil {
		return model.ChordCheckResponse{}, err
	}

	// レスポンスを作成
	return s.responseConverter.Convert(chords, scaleTones)
}
