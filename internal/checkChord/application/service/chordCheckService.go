package service

import (
	"Harmony-Tune/internal/checkChord/domain/model"
	"Harmony-Tune/internal/checkChord/presentation/models"
)

type ChordCheckService struct{}

func NewChordCheckService() *ChordCheckService {
	return &ChordCheckService{}
}

func (s *ChordCheckService) CheckAndTuneChord(
	req models.ChordCheckRequest,
) (models.ChordCheckResponse, error) {
	//コードを特定

	//特定したコードの構成音の詳細情報を作成

	// レスポンスを作成
	return models.ChordCheckResponse{
		ChordList: []model.Chord{
			{
				ChordName:        "C Major",
				ChordNameInScale: "I Major",
				NoteArray: []model.Note{
					{NoteNumber: 60, DegreeInChord: 1},
					{NoteNumber: 64, DegreeInChord: 3},
					{NoteNumber: 67, DegreeInChord: 5},
				},
			},
		},
	}, nil
}
