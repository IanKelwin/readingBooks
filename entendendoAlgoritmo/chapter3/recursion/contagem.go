package main

import "fmt"

func contagem(i int) {
	if i < 0 {
		return 
	}
	fmt.Println(i)
	contagem(i - 1)
}

func main() {
	contagem(3)
}