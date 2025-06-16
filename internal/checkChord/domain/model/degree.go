package model

type Degree struct {
	DegreeName           string  `json:"degreeName" example:"長3度"`
	CentsFromEqualToJust float64 `json:"centsFromEqualToJust" example:"-14"`
}
