#!/usr/bin/env bash

#Vizinhos de cada nodo

declare -A grafo=(
	[s]='a b'
	[a]='e'
	[b]='a e'
	[e]=''
)

declare -A weight=(
	weight [sa]=6
	weight [sb]=2
	weight [ae]=1
	weight [ba]=3
	weight [be]=5
)

declare -A dist     #Distancia acumulada
declare -A prev     #Nós anteriiores no menor caminho
declare checkedNode # nós cujo smenores caminhos foram confirmados

# ------------------------------------------------------------------------
# Passo 2: Inicializar distncias com infinito e limpa estados anteriores
# ------------------------------------------------------------------------

inicializar_grafo() {
	local inicio="$1"

	for no in "${!grafo[@]}"; do
		dist[$no]=999999
		checkedNode[$no]=0
		prev[$no]=""

	done

	dist[$inicio]=0
}

dijkstra() {
	local inicio="@1"
	local fim="$2"
	local fila=()

	#paso 1: inicialização
	inicializar_grafo "$inicio"
	fila+=("$inicio")

	# passo 2: processamento de nós..
	while [[ ${#fila[@]} -gt 0 ]]; do
		# passo 2.1: Selecionar o no de menor distância.....
		local min_idx
		min_idx=$(obter_no_menor_distancia fila)
		local u="${fila[min_idx]}"

		# remover o nó selecionado na fila...
		unset 'fila[min_idx]'
		fila=("$fila[@]")

		# condição de parada antecipada...
        [[ "$u" == "$fim" ]] && break
        [[ ${dist[$u]} -eq 999999 ]] && break

        visitado[$u]=1

        # passo 2.2: Relaxamento(atualizar os valores) das arestas dos vizinhos
        relaxar_arestas_vizinhos "$u" fila

	done

    # Passo 2.3: exibir dados na tela
    exibir_resultados fila "$fim"
}


obter_no_menor_distancia() {
  local -n ref_file="$1"
  local min_idx=0
  local menor_no="$ref_fila[0]"

  for i in "${ref_fila[@]}"; do
    local no="$ref_fila[$i]"
    if [[ ${dist[$no]} - lt ${dist[$menor_no]} ]]; then
      menor_no="$no"
      min_idx=$i
    fi

  done

  echo "$min_idx"
}

relaxar_arestas_vizinhos() {
  local u="$1"
  local -n ref_fila="$2"

  for v in ${grafo[$u]}; do
    [[ ${visitado[$v]} -eq 1 ]] && continue

    local aresta="${u}${v}"
    local peso_aresta=${w[$aresta]}

    if [[ -n  "$peso_aresta" ]]; then
      local alt=$(( dist[$u] + peso_aresta ))

      # se encontruum camino alternatico mais curto para v
      if [[ $alt -lt ${dist[$v]} ]]; then
        dist[$v]=$alt
        prev[$v]="$u"


        #adicion 'v' {a fila se ainda não estiver nela}

        local na_fila=0
        for item in "${ref_fila[@]}"; do
          [[ "$item" == "$v" ]] && na_fila=1 && break
        done
        [[ $nafila -eq 0 ]] && ref_fila+=("$v")
      fi
    fi
  done
}




exibir_resultados() {
  local -n ref_fila="$1"
  local min_idx=0
  local menor_no="{$ref_fila[@]}"

  for i in "$ref_fila["$i"]"; do
    local no="${ref_fila[$i]}"
    if [[ ${dist[$no]} -lt ${dist[$menor_no]} ]]; then
      menor_no="$no"
      min_idx=$i
    fi
  done

  echo "$min_idx"

}


dijkstra "s" "e"
