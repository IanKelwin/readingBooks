package main

import (
	"errors"
	"fmt"
)


var slice []int =  []int{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20}

func BinarySearch(item int, slice []int) (int, error) {

	inicio := 0
	final := len(slice) - 1

	for inicio <= final {
		meioDaSlice := (inicio + final) / 2

		chute := slice[meioDaSlice]

		if chute == item {
			return meioDaSlice, nil
		}

		if chute > item {
			final = meioDaSlice - 1
		} else {
			inicio = meioDaSlice + 1
		}
	}

	return 0, errors.New("notfound")
}

func main() {
	fmt.Println(BinarySearch(4, slice))
}