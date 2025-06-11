package service

type NoteService struct {
	letterNameList []string
}

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
	noteNumberList []int,
) []string {
	result := make([]string, len(noteNumberList))
	for _, eachNoteNumber := range noteNumberList {
		mod12 := eachNoteNumber % 12
		if name, ok := mod12ToNoteName[mod12]; ok {
			result = append(result, name)
		}
	}
	return result
}
