package main

import (
	"fmt"
	"github.com/go-chi/chi"
	"net/http"
)

func main() {
	fmt.Println("Hello From the Server")
	r := chi.NewRouter()

	r.Get("/", func(w http.ResponseWriter, r *http.Request) {
		w.Write([]byte("Hello From the Server"))
	})

	http.ListenAndServe(":3000", r)
}
