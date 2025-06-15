package service

type NoteServiceInterface interface {
	ConvertNoteNumberToLetterName([]int) []string
}

// IF通りの実装になっているかチェック
var _ NoteServiceInterface = (*NoteService)(nil)

type NoteService struct{}

var mod12ToNoteName = map[int]string{
	0:  "C",
	1:  "C#",
	2:  "D",
	3:  "D#",
	4:  "E",
	5:  "F",
	6:  "F#",
	7:  "G",
	8:  "G#",
	9:  "A",
	10: "A#",
	11: "B",
}

func NewNoteService() *NoteService {
	return &NoteService{}
}

func (s *NoteService) ConvertNoteNumberToLetterName(
	noteNumberArray []int,
) []string {
	result := make([]string, 0, len(noteNumberArray))
	for _, eachNoteNumber := range noteNumberArray {
		mod12 := eachNoteNumber % 12
		if name, ok := mod12ToNoteName[mod12]; ok {
			result = append(result, name)
		}
	}
	return result
}
