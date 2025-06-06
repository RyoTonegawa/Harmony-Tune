package main

import (
	checkchord "Harmony-Tune/internal/checkChord"

	"github.com/gin-gonic/gin"
)

func main() {
	r := gin.Default()
	api := r.Group("")
	checkchord.InitChordCheckModule(api)
	r.Run(":8080")
}
