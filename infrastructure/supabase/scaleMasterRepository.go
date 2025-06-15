package supabase

import (
	"encoding/json"
	"fmt"
	"net/http"
	"net/url"
	"os"
	"time"
)

// ─── 環境依存値 ────────────────────────────────
// 推奨：.zshrc や .env で定義しておく
var (
	baseURL    = os.Getenv("SUPABASE_BASE_URL")          // 例: https://wqblclcncvtoxnhpzafz.supabase.co/rest/v1/
	apiKey     = os.Getenv("SUPABASE_API_KEY")           // anon でも service でも OK
	authToken  = os.Getenv("SUPABASE_AUTH_TOKEN")        // 無ければ apiKey を再利用
	httpClient = &http.Client{Timeout: 10 * time.Second} // 再利用用の単一クライアント
)

// スケール行の DTO
type scaleDTO struct {
	Notes []string `json:"notes"`
}

// GetScaleNotesByKeyAndName  ── スケール構成音を取得
func GetScaleNotesByKeyAndName(scaleKey, scaleName string) ([]string, error) {
	// ---------- 前提チェック ----------
	if baseURL == "" {
		return nil, fmt.Errorf("SUPABASE_BASE_URL is empty")
	}
	if apiKey == "" {
		return nil, fmt.Errorf("SUPABASE_API_KEY is empty")
	}
	if authToken == "" { // AUTH_TOKEN を個別に用意していない場合は API キーを流用
		authToken = apiKey
	}

	// ---------- URL 組み立て ----------
	endpoint := baseURL + "scale_master"
	q := url.Values{}
	q.Add("scale_key", "eq."+scaleKey)
	q.Add("scale_name", "eq."+scaleName)
	req, err := http.NewRequest(http.MethodGet, endpoint+"?"+q.Encode(), nil)
	if err != nil {
		return nil, err
	}

	// ---------- 認証ヘッダ ----------
	req.Header.Set("apikey", apiKey)
	req.Header.Set("Authorization", "Bearer "+authToken)
	req.Header.Set("Accept", "application/json")

	// ---------- 実行 ----------
	resp, err := httpClient.Do(req)
	if err != nil {
		return nil, err
	}
	defer resp.Body.Close()

	if resp.StatusCode != http.StatusOK {
		return nil, fmt.Errorf("supabase returned %d", resp.StatusCode)
	}

	// ---------- デコード ----------
	var rows []scaleDTO
	if err := json.NewDecoder(resp.Body).Decode(&rows); err != nil {
		return nil, err
	}
	if len(rows) == 0 {
		return nil, fmt.Errorf("scale not found: key=%s name=%s", scaleKey, scaleName)
	}

	return rows[0].Notes, nil
}
