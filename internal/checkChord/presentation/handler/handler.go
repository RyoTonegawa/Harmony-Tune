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
	chordService *service.ChordCheckService
}

func NewChordCheckHandler(
	chordService *service.ChordCheckService,
) *ChordCheckHandler {
	return &ChordCheckHandler{chordService: chordService}
}

// @Tags chord
// @Summary determine chord and tune
// @Accept json
// @Produce json
// @Router /v1/chord/check [post]
// @Param request body models.ChordCheckRequest true "Note numbers and key info"
// @Success 200 {object} models.ChordCheckResponse
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
