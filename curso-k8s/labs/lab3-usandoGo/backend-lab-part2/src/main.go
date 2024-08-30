package main

import (
	// segunda iteracion usar "fmt"
	"encoding/json" ///se agrega para la 3ra iteracion
	"net/http"
	"os"
	"time"
)

type HandsOn struct{
	Time time.Time `json:"time"`
	Hostname string `json:"hostname"`
}

func ServeHTTP(w http.ResponseWriter, r *http.Request) {
	
	//w.Write([]byte(`{"message": "hello world"}`))
	// segunda iteracion solo imprimiendo a la maldita sea
	//resp := fmt.Sprintf("La hora es %v y hostname es %v", time.Now(), os.Getenv("HOSTNAME")) 
	// tercera iteraccion respondiendo un json
	resp := HandsOn{
		Time: time.Now(),
		Hostname: os.Getenv("HOSTNAME"),
	}

	jsonResp, err := json.Marshal(&resp)
	if err != nil {
		w.Write([]byte("Error"))
	}
	/// fin tercera iteracion
	//para la primera y segun iteracion se usa asi w.Write([]byte(resp))
	//para la tercera cambiamos
    // se comento para la cuarta iteracion ---> w.WriteHeader(http.StatusOK)
	w.Header().Set("Content-Type", "application/json")
	w.Header().Set("Access-Control-Allow-Origin", "*")
    w.Write(jsonResp)
}

func main() {
    http.HandleFunc("/", ServeHTTP)
    http.ListenAndServe(":9090", nil)
}