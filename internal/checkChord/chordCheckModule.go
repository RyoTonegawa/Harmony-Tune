package checkchord

import (
	applicationService "Harmony-Tune/internal/checkChord/application/service"
	domainService "Harmony-Tune/internal/checkChord/domain/service"
	"Harmony-Tune/internal/checkChord/presentation/handler"

	"github.com/gin-gonic/gin"
)

func InitChordCheckModule(r *gin.RouterGroup) {
	// 依存を組み立て
	noteSvc := domainService.NewNoteService()
	scaleSvc := domainService.NewScaleService()
	chordSvc := domainService.NewChordService()
	respConv := domainService.NewResponseConverter(
		scaleSvc,
	)
	chordService := applicationService.NewChordCheckService(
		noteSvc,
		scaleSvc,
		chordSvc,
		respConv,
	)
	chordCheckHandler := handler.NewChordCheckHandler(chordService)

	r.POST("v1/chord/check", chordCheckHandler.Check)
}
