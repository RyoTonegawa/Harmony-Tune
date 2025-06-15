package supabase

import (
	"Harmony-Tune/internal/checkChord/domain/model"
	"encoding/json"
	"fmt"
	"io"
	"net/http"
	"net/url"
	"os"
)

type ChordMasterDto struct {
	Root      string `json:"root"`
	ChordName string `json:"chord_name"`
	// JsonとJsonRawの違いとは？JSON.parseされていないだけ？
	Tones   []string `json:"tones"`
	Degrees []string `json:"degrees"`
}

type SupabaseChordMasterRepository struct {
	BaseUrl    string
	ApiKey     string
	HttpClient *http.Client
}

func NewSupabaseChordMasterRepository() *SupabaseChordMasterRepository {
	return &SupabaseChordMasterRepository{
		BaseUrl:    os.Getenv("SUPABASE_BASE_URL"),
		ApiKey:     os.Getenv("SUPABASE_API_KEY"),
		HttpClient: &http.Client{},
	}
}

func (r *SupabaseChordMasterRepository) GetChordMastersByExactTones(
	letterNameArray []string,
) ([]model.Chord, error) {
	jsonArray, err := json.Marshal(letterNameArray)
	if err != nil {
		return nil, err
	}
	// ここで何してる？
	query := url.Values{}
	// csとcdの違いとは？
	// csは部分一致、cdは完全一致、二つ合わせると順不同で完全一致
	// -- SQL的にはこう：
	// WHERE tones @> '["C","E","G"]' AND tones <@ '["C","E","G"]'
	// AddではなくSetを2回使うと2回目で上書きされるので、Setの後はAddを使って条件を足す
	query.Set("tones", "cs."+string(jsonArray))
	query.Add("tones", "cd."+string(jsonArray))

	fullUrl := fmt.Sprintf("%s/chord_master?%s", r.BaseUrl, query.Encode())
	// NewRequestとはなんのために使われる？
	// Httpリクエストを作成するために使われる、Httpメソッド、URL、ボディが引数
	req, err := http.NewRequest("GET", fullUrl, nil)
	if err != nil {
		return nil, err
	}
	// なぜAPI Keyを2回セットしている？
	// →単純にsupabaseのルール
	req.Header.Set("apikey", r.ApiKey)
	req.Header.Set("Authorization", "Bearer "+r.ApiKey)
	req.Header.Set("Accept", "application/json")
	// DoでHttpリクエストを投げ、結果が返される。
	response, err := r.HttpClient.Do(req)
	if err != nil {
		return nil, err
	}
	if response.StatusCode != http.StatusOK {
		/**
		// ReadAllでいう　err == EOFとは？
		// HTTPリクエストの終わりまで全て読み込むということ
		*/
		body, _ := io.ReadAll(response.Body)
		return nil, fmt.Errorf("unexpected status code: %d, body: %s", response.StatusCode, string(body))
	}
	// deferって何？
	//Closeしないと内部的挙動的にどうなるの？
	// 関数終了時に HTTPレスポンスのボディをクローズ（メモリ解放）するため
	// これをしないとTCP接続がリークし、プロセスが詰まる
	// リーク＝接続を保持したままになり、ファイルディスクリプタを使い切ってしまうこと
	defer response.Body.Close()

	var chordMasterDtoArray []ChordMasterDto
	// BodyをchordMasterDtoArrayに変換するということ？
	err = json.NewDecoder(response.Body).Decode(&chordMasterDtoArray)
	if err != nil {
		return nil, err
	}
	// make関数について詳しく教えて
	// model.Chord 型のスライスを 長さ len(chordMasterDtoArray) で作成する
	// ※スライス＝可変長配列。スライスはポインタ、最大長(capacity)、現在の長さ(length)を持つ
	// あらかじめサイズを確保することで append() よりパフォーマンスが良くなる
	// ループで直接 s[i] = ... と代入できる
	chordMasters := make([]model.Chord, len(chordMasterDtoArray))
	for i, chordMasterDto := range chordMasterDtoArray {
		chordMasters[i] = r.convertChordMasterDtoToChord(chordMasterDto)
	}
	return chordMasters, nil
}

func (r *SupabaseChordMasterRepository) convertChordMasterDtoToChord(
	chordMasterDto ChordMasterDto,
) model.Chord {
	var toneArray []string
	var degreeArray []string
	// unmarshal と　marshalの違いとは？
	// Marshal→ByteからGoの構造体
	// Unmarshal→Goの構造体に変換
	// json.Unmarshal(chordMasterDto.Tones, &toneArray)
	// json.Unmarshal(chordMasterDto.Degrees, &degreeArray)

	var chordTones []model.ChordTone
	for i := range toneArray {
		degree := ""
		if i < len(degreeArray) {
			degree = chordMasterDto.Degrees[i]
		}
		chordTones = append(chordTones, model.ChordTone{
			LetterName: chordMasterDto.Tones[i],
			Degree:     degree,
		})
	}

	return model.Chord{
		ChordRootNote:  chordMasterDto.Root,
		ChordType:      chordMasterDto.ChordName, // Rootなど別フィールドがあればここで詰める
		ChordToneArray: chordTones,
	}
}
