package main

import "fmt"

func soma(slice []int) int {
	if len(slice) == 1 {
		return slice[0]
	}

	
	return slice[0] + soma(slice[1:])
}

func main() {
	slice := []int{1, 2, 4}
	
	fmt.Println("resultado: ",soma(slice))
}