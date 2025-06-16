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

var justIntonationCentsAdjustment = map[string]float64{
	// 1度 (Unison)
	"ルート": 0.0, // 完全1度 (Root)

	// 2度 (Second)
	"短2度": 11.73, // ♭2
	"長2度": 3.91,  // 2

	// 3度 (Third)
	"短3度": 15.64,  // ♭3
	"長3度": -13.69, // 3

	// 4度 (Fourth)
	"完全4度": -1.96, // 4
	"増4度":  -9.78, // ♯4
	"減5度":  -9.78, // ♭5

	// 5度 (Fifth)
	"完全5度": 1.96, // 5
	"増5度":  5.87, // ♯5

	// 6度 (Sixth)
	"短6度": 13.69,  // ♭6
	"長6度": -15.64, // 6

	// 7度 (Seventh)
	"短7度": -3.91,  // ♭7
	"長7度": -11.73, // 7

	// 9度 (Ninth)
	"短9度": 11.73, // ♭9
	"長9度": 3.91,  // 9

	// 11度 (Eleventh)
	"完全11度": -1.96, // 11
	"増11度":  -9.78, // ♯11

	// 13度 (Thirteenth)
	"短13度": 13.69,  // ♭13
	"長13度": -15.64, // 13
}

type ChordMasterDto struct {
	Root      string `json:"root"`
	ChordName string `json:"chord_name"`
	// JsonとJsonRawの違いとは？JSON.parseされていないだけ？
	Tones   json.RawMessage `json:"tones"`
	Degrees json.RawMessage `json:"degrees"`
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
	json.Unmarshal(chordMasterDto.Tones, &toneArray)
	json.Unmarshal(chordMasterDto.Degrees, &degreeArray)
	var chordTones []model.ChordTone
	for i := range toneArray {
		degree := model.Degree{}
		if i < len(degreeArray) {
			degree = model.Degree{
				DegreeName:           degreeArray[i],
				CentsFromEqualToJust: justIntonationCentsAdjustment[degreeArray[i]],
			}
		}
		chordTones = append(chordTones, model.ChordTone{
			LetterName: toneArray[i],
			Degree:     degree,
		})
	}

	return model.Chord{
		ChordRootNote:  chordMasterDto.Root,
		ChordType:      chordMasterDto.ChordName, // Rootなど別フィールドがあればここで詰める
		ChordToneArray: chordTones,
	}
}
