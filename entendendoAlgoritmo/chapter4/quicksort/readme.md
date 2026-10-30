# Quicksort

Ele usa a estrátegia dividir para conquistar, logo ele
é recursivo, ele organizar arrays.

Como todo algoritmo recursivo, temos que encontrar o caso base e o caso recursivo,
como vamos utilizar a tecnica DC, temos que acada recursão dividir nosso problema
até o caso mais simples possível. Então digamos que temos que
organizar um array de números [2,6,7,4,3] na ordem correta! Qual seria o array
mas simples de se ordenar? um array com apenas um elemento [3] ou um array vazio []
pois não é necessário ordenar! achamos o **caso base**.


```Golang

if len(array) < 2 {
    return array
}

```

Agora vamos para o caso recursivo! Como vamos reduzir nosso problema?
O quicksort usa a seguinte estratégia, inicialmente iremos escolher
um elemento do nosso array! Chama-mos ele de PIVO! tecnicamente podemos
escolher qualquer PIVO, mas é importante dizer que o PIVO determinará 
o BIG O do algoritmo! no caso médio do Quicksort ele é O (n log n), mas seu 
pior caso é O(n²) que é tão lento quanto a ordenação por seleção!

```Golang
    pivo := array[int(len(array) / 2 )] // elemento do meio do array
```

Nesse exemplo irei escolher o elemento central do array como pivo! 
E agora você deve está se perguntando: -- mas definir um pivo ainda
não diminui nosso problema! E de fato não, mas agora que vem 
a mágica! iremos subdividir nosso array apartir do pivo! 
[elementos menores que o pivo] + [pivo] + [elementos maiores que o pivo]
e então podemos ultilizar recursão chamando o quicksort nos subarrays.

