package checkchord

import (
	"Harmony-Tune/internal/checkChord/application/service"
	"Harmony-Tune/internal/checkChord/presentation/handler"

	"github.com/gin-gonic/gin"
)

func InitChordCheckModule(r *gin.RouterGroup) {
	chordCheckService := service.NewChordCheckService()
	chordCheckHandler := handler.NewChordCheckHandler(chordCheckService)

	// ↓ モジュール的にルーティング登録
	r.POST("v1/chord/check", chordCheckHandler.Check)
}
