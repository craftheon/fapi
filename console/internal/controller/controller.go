package controller

import (
	"net/http"

	"github.com/gin-gonic/gin"
)

func New() {
	r := gin.New()
	r.GET("/", func(c *gin.Context) {
		c.JSON(http.StatusOK, gin.H{
			"message": "Hello world",
		})
	})
	r.Run()
}
