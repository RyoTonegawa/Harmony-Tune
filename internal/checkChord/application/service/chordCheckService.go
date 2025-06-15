package service

import (
	"Harmony-Tune/internal/checkChord/domain/service"
	"Harmony-Tune/internal/checkChord/presentation/models"
)

type ChordServiceInterface interface {
}

type ChordService struct {
	noteservice       service.NoteServiceInterface
	scaleService      service.ScaleServiceInterface
	chordService      service.ChordServiceInterface
	responseConverter service.ResponseConverterInterface
}

func NewChordCheckService(
	noteSvc service.NoteServiceInterface,
	scaleSvc service.ScaleServiceInterface,
	chordSvc service.ChordServiceInterface,
	responseConverter service.ResponseConverterInterface,
) *ChordService {
	return &ChordService{
		noteservice:       noteSvc,
		scaleService:      scaleSvc,
		chordService:      chordSvc,
		responseConverter: responseConverter,
	}
}

func (s *ChordService) CheckAndTuneChord(
	req models.ChordCheckRequest,
) (models.ChordCheckResponse, error) {
	// ノートナンバーを音名に変換
	letterNameArray := s.noteservice.ConvertNoteNumberToLetterName(
		req.NoteNumberArray,
	)
	// スケールの構成音を取得
	scaleTones, err := s.scaleService.GetScaleTones(
		&req.KeySignature,
		&req.ScaleType)
	if err != nil {
		return models.ChordCheckResponse{}, err
	}
	//　構成音からコードを特定
	chords, err := s.chordService.DetermineChord(
		letterNameArray,
		scaleTones,
	)
	if err != nil {
		return models.ChordCheckResponse{}, err
	}
	// レスポンスを作成
	return s.responseConverter.Convert(chords)
}
