package service

import (
	"Harmony-Tune/internal/checkChord/domain/model"
	"Harmony-Tune/internal/checkChord/domain/service"
	"Harmony-Tune/internal/checkChord/presentation/models"
)

type ChordCheckService struct {
	noteservice  *service.NoteService
	scaleService *service.ScaleService
	chordService *service.ChordCheckService
}

func NewChordCheckService() *ChordCheckService {
	return &ChordCheckService{}
}

func (s *ChordCheckService) CheckAndTuneChord(
	req models.ChordCheckRequest,
) (models.ChordCheckResponse, error) {
	// ノートナンバーを音名に変換
	letterNameList := s.noteservice.ConvertNoteNumberToLetterName(
		req.NoteNumberList,
	)
	// スケールの構成音を取得
	scaleTones, error := s.scaleService.GetScaleTones(
		req.KeySignature,
		req.ScaleType)
	//　構成音からコードを特定し、スケール内外のコードどちらかを判定
	s.chordService.DetermineChord(letterNameList, scaleTones)
	//特定したコードの構成音の詳細情報を作成

	// レスポンスを作成
	return models.ChordCheckResponse{
		ChordList: []model.Chord{
			{
				ChordName: "C Major",
				ChordType: "I Major",
				ChordToneArray: []model.ChordTone{
					{LetterName: "C", Degree: "1"},
				},
			},
		},
	}, nil
}
