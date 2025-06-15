package main

import (
	_ "Harmony-Tune/docs"
	checkchord "Harmony-Tune/internal/checkChord"

	"github.com/gin-gonic/gin"
	swaggerFiles "github.com/swaggo/files"
	ginSwagger "github.com/swaggo/gin-swagger"
)

func main() {
	r := gin.Default()
	api := r.Group("")
	checkchord.InitChordCheckModule(api)
	r.GET("/swagger/*any",
		ginSwagger.WrapHandler(
			swaggerFiles.Handler,
		),
	)
	r.Run(":8080")
}
