package main

import (
	"bfs/queue"
	"fmt"
	// "slices"
)

func isMangoSaller(value string) bool {
	valueByte := []byte(value)

	return string(valueByte[len(value) - 1]) == "m"
}

var grafo map[string][]string = map[string][]string{
	"você" : {"bob", "alice", "claire"},
	"bob" : {"anuj", "peggy"},
	"alice" : {"peggy"},
	"claire" : {"thom", "jonny"},
	"anuj" : {},
	"jonny" : {},
	"thom" : {},
	"peggy" : {},

}

func BFS(pointerStrt string)  {
	queueNeighbor := queue.Queue{}
	// var visited []string
	queueNeighbor.Enqueue(grafo[pointerStrt])

	for queueNeighbor.Head != nil {
		pessoa := queueNeighbor.Dequeue()

		fmt.Println(pessoa)

		

		

	// 	if slices.Contains(visited, pessoa) {
	// 		continue
	// 	}

	// 	fmt.Println("pessoa atualmente: ", pessoa)

		
	// 	fmt.Println("pessoa atual para ver se tem manga: ", pessoa)
	// 	if isMangoSaller(pessoa) {
	// 		fmt.Println("é vendedor de manga!")
	// 		return true
	// 	}

	// 	visited = append(visited, pessoa)
	// 	queueNeighbor.Enqueue(grafo[pessoa])
		
	}

	// return false

}

func main() {
	BFS("você")
	fmt.Println("tem vendedor de manga? : ", )
}