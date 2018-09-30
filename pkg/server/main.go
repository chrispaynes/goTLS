package main

import (
	"log"
	"net/http"
	"time"

	"github.com/go-chi/chi"
	"github.com/go-chi/chi/middleware"
)

func main() {
	r := chi.NewRouter()

	r.Use(middleware.Timeout(30 * time.Second))

	r.Get("/", func(w http.ResponseWriter, r *http.Request) {
		w.Write([]byte("Hello From the Server"))
	})

	err := http.ListenAndServeTLS(":8443", "./server.crt", "./server.key", r)

	if err != nil {
		log.Fatal(err)
	}
}
