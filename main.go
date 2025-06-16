package main

import (
	_ "Harmony-Tune/docs"
	checkchord "Harmony-Tune/internal/checkChord"
	"Harmony-Tune/internal/logger"
	"Harmony-Tune/internal/middleware"

	"github.com/gin-gonic/gin"
	swaggerFiles "github.com/swaggo/files"
	ginSwagger "github.com/swaggo/gin-swagger"
)

func main() {
	r := gin.Default()
	log := logger.NewLogger()

	r.Use(gin.Recovery())                // パニック時自動復旧
	r.Use(middleware.RequestLogger(log)) // ロガーミドルウェア

	api := r.Group("")
	checkchord.InitChordCheckModule(api) // ロガー注入しない構成（変更しない）

	r.GET("/swagger/*any", ginSwagger.WrapHandler(swaggerFiles.Handler))
	r.Run(":8080")
}
