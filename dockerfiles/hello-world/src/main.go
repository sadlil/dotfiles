package main

import (
	"net/http"
	"log"
)

func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		log.Print("recevied request for URL: " + r.URL.String())
		w.WriteHeader(200)
		w.Write([]byte("Hello World!"))
	})
	http.ListenAndServe(":8080", nil)
}
