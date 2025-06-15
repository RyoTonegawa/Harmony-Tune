package repository

import "Harmony-Tune/internal/checkChord/domain/model"

type GetChordMastersByExactTones interface {
	FindAll(letterNameArray []string) ([]model.Chord, error)
}
