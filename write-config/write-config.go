package main

import (
	"fmt"
	"os"
	"strings"
)

func main() {
	var output = `
	server { 
		listen       $PORT; 
		server_name  localhost; 
		location / { 
			root   /usr/share/nginx/html; 
			index  index.html index.htm; 
		} 
		# redirect server error pages to the static page /50x.html 
		error_page   500 502 503 504  /50x.html; 
		location = /50x.html { 
			root   /usr/share/nginx/html; 
		} 
	} 	
	`
	var port = os.Getenv("PORT")
	if port == "" {
		port = "80"
	}
	fmt.Println(strings.Replace(output, "$PORT", port, 1))
}
