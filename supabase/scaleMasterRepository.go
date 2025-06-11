package supabase

import (
	"encoding/json"
	"fmt"
	"net/http"
	"net/url"
	"os"
)

type ScaleDto struct {
	Notes []string `json:"notes"`
}

func GetScaleNotesByKeyAndName(scaleKey, scaleName string) ([]string, error) {
	endpoint := baseURL + "scale_master"

	q := url.Values{}
	q.Add("scale_key", "eq."+scaleKey)
	q.Add("scale_name", "eq."+scaleName)

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

	var result []ScaleDto
	err = json.NewDecoder(resp.Body).Decode(&result)
	if err != nil {
		return nil, err
	}

	if len(result) == 0 {
		return nil, fmt.Errorf("no scale found for key: %s and name: %s", scaleKey, scaleName)
	}

	return result[0].Notes, nil
}
