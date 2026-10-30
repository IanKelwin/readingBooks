#!/usr/bin/env bash

declare -A grafo

grafo[livro]='lp poster'
grafo[lp] = 'baixo bateria'
grafo[poster]='baixo bateria'
grafo[baixo]='piano'
grafo[bateria]='piano'
grafo[piano]=''

declare -A pesos
