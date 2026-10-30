package contagemerro

import "fmt"

func contagem(i int) {
	fmt.Println(i)
	contagem(i - 1)
}

func main() {
	contagem(3)
}