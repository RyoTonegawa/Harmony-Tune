package supabase

import (
	"Harmony-Tune/internal/chordCheck/domain"
	"Harmony-Tune/internal/chordCheck/domain/model"
	"encoding/json"
	"fmt"
	"net/http"
	"net/url"
	"os"
)

const baseURL = "https://yftiasixpawnfvndxoqc.supabase.co/rest/v1/"

type ChordMasterDto struct {
	Root      string   `json:"root"`
	ChordName string   `json:"chord_name"`
	Tones     []string `json:"tones"`
	Degrees   []string `json:"degrees"`
}

func GetChordMastersByExactTones(tones []string) ([]model.Chord, error) {
	endpoint := baseURL + "chord_master"

	q := url.Values{}
	toneArrayJson, _ := json.Marshal(tones)
	q.Add("tones", "cs."+string(toneArrayJson))
	q.Add("tones", "cd."+string(toneArrayJson))

	req, err := http.NewRequest("GET", endpoint+"?"+q.Encode(), nil)
	if err != nil {
		return nil, err
	}

	req.Header.Add("apikey", os.Getenv("SUPABASE_API_KEY"))
	req.Header.Add("Authorization", "Bearer "+os.Getenv("SUPABASE_AUTH_TOKEN"))
	req.Header.Add("Accept", "application/json")

	resp, err := HttpClient.Do(req)
	if err != nil {
		return nil, err
	}
	defer resp.Body.Close()

	if resp.StatusCode != http.StatusOK {
		return nil, fmt.Errorf("unexpected status code: %d", resp.StatusCode)
	}

	var dtoList []ChordMasterDto
	err = json.NewDecoder(resp.Body).Decode(&dtoList)
	if err != nil {
		return nil, err
	}

	var result []model.Chord
	for _, dto := range dtoList {
		result = append(result, domain.ConvertDtoToChord(dto))
	}
	return result, nil
}
