package handler

import (
	"net/http"

	"Harmony-Tune/internal/checkChord/application/service"
	"Harmony-Tune/internal/checkChord/presentation/models"

	"github.com/gin-gonic/gin"
)

type ChordCheckHandlerInterface interface {
	Check(*gin.Context)
}

var _ ChordCheckHandlerInterface = (*ChordCheckHandler)(nil)

type ChordCheckHandler struct {
	chordService *service.ChordService
}

func NewChordCheckHandler(
	chordService *service.ChordService,
) *ChordCheckHandler {
	return &ChordCheckHandler{chordService: chordService}
}

func (h *ChordCheckHandler) Check(c *gin.Context) {
	var req models.ChordCheckRequest
	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(http.StatusBadRequest,
			gin.H{"error": err.Error()})
		return
	}
	res, err := h.chordService.CheckAndTuneChord(
		req)
	if err != nil {
		c.JSON(
			http.StatusInternalServerError,
			gin.H{"error": err.Error()},
		)
		return
	}
	c.JSON(http.StatusOK, res)
}
