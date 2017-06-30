package main

import (
	"fmt"
	"log"
	"net/http"
	"net/http/httputil"
)

func processRequest(rw http.ResponseWriter, req *http.Request) {

	requestDump, err := httputil.DumpRequest(req, true)
	if err != nil {
		fmt.Println(err)
	}
	fmt.Println(string(requestDump))
}

func main() {
	http.HandleFunc("/webhookViewer", processRequest)
	log.Fatal(http.ListenAndServe(":8082", nil))
}
