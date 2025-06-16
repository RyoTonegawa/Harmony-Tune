package middleware

import (
	"time"

	"Harmony-Tune/internal/logger"

	"github.com/gin-gonic/gin"
	"github.com/google/uuid"
)

const RequestIDKey = "RequestID"

func RequestLogger(log logger.Logger) gin.HandlerFunc {
	return func(c *gin.Context) {
		requestID := uuid.New().String()
		c.Set(RequestIDKey, requestID)
		c.Writer.Header().Set("X-Request-ID", requestID)

		start := time.Now()

		log.WithFields(map[string]interface{}{
			"request_id": requestID,
			"method":     c.Request.Method,
			"path":       c.Request.URL.Path,
		}).Info("[START] Incoming request")

		c.Next()

		log.WithFields(map[string]interface{}{
			"request_id": requestID,
			"method":     c.Request.Method,
			"path":       c.Request.URL.Path,
			"status":     c.Writer.Status(),
			"duration":   time.Since(start).Milliseconds(),
		}).Info("[END] Completed request")
	}
}
