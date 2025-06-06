package handler

import (
	"net/http"

	"Harmony-Tune/internal/checkChord/application/service"
	"Harmony-Tune/internal/checkChord/presentation/models"

	"github.com/gin-gonic/gin"
)

type ChordCheckHandler struct {
	chordCheckService *service.ChordCheckService
}

func NewChordCheckHandler(
	chordCheckService *service.ChordCheckService) *ChordCheckHandler {
	return &ChordCheckHandler{chordCheckService: chordCheckService}
}

func (h *ChordCheckHandler) Check(c *gin.Context) {
	var req models.ChordCheckRequest
	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(http.StatusBadRequest,
			gin.H{"error": err.Error()})
		return
	}
	res, err := h.chordCheckService.CheckAndTuneChord(
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
