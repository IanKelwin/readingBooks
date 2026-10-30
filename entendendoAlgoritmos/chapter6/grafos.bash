#!/bin/bash

#grafo com vetor associativo (hash)...
#
declare -A grafo

grafo[eu]='alice bob claire' # Alice, Bob e Claire são meu svizinhos, mas eu não sou vizinho deles
grafo[alice]='peggy'         # peggy é vizinha de alice, mas a paggy não é vizinha de alize
grafo[bob]='anuj peggy'      # Anuj e Peggy são vizinhos de Bob, mas Bob não´é vizinho deles
grafo[claire]='thom jonny'   # Thom e Jonny são vizinhos de claire, mas claire não é vizinho deles.
grafo[peggy]=''              # peggy não tem vizinhos
grafo[anuj]=''               # anuj não tem vizinhos
grafo[thom]=''               # Thom não tem vizinhos
grafo[jonny]=''              # Jonny não possui vizinhos.

## Criando a fila dos vizinhos

declare -a fila=(${grafo[eu]}) ## Isso funcionará devido a como o o bash lida com string

# Criar metodos para pedronixar e tratr a fila

queue_enqueue() {
	fila+=(${grafo[$1]})
}

queue_dequeue() {
	fila[0]=''
	fila=(${fila[@]})
}

queue_print() {
	echo -e "\e[33;1mFila:\e[0m ${fila[@]}"
}

check_front() {
	prompt="$1 Vocẽ vende mangas? (s/N) "

	read -rep "$prompt"
	[[ ${REPLY,,} == s ]] || return 1
}

declare -a checked=''

already_checked() {
	[[ ${checked[@]} == *$1* ]]
}

queue_print

while :; do

	vizinho=${fila[0]}

	if already_checked $vizinho; then
		queue_dequeue
		echo "$vizinho já foi consultado!"
		queue_print
		continue
	fi

	if check_front $vizinho; then

		printf '%s\n' "$vizinho vende mangas!" Fim
		exit
	fi

	checked+=($vizinho)
	queue_enqueue $vizinho
	queue_dequeue

	# Verifica se a fila está vazia
	if [[ ${fila[@]} ]]; then
		queue_print
	else
		echo "Sem mais vizinhos para consultar..."
		exit
	fi

done
