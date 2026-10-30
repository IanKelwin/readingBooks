## Caso base e caso recursivo

<p>Por conta de ser recursivo, é normal acabar escrevendo uma função recursiva
erroniamente. Causando um Loop infinito! Imagine que temos um <a href="./contagem_erro/contagem_regressiva_errado.py">
    algoritmo que faça
    uma contagem regressiva
</a> | <a href="./contagem_erro/contagem_erro.go">versão em go</a>: 3... 2... 1... 0 </p>

``` lang="golang"
package main

import "fmt"

func Contagem( i int ) {

    fmt.PrintLn(i)

    Contagem(i - 1)
}

``` 

<p>
    Nesse caso temos uma função recursiva codificada de forma errada!
    Por isso funções recursivas tem duas partes! O caso <strong>Base</strong> e o caso <strong>recursivo</strong>
</p>

## Caso Base
<p>O caso base é a parte da função recursiva que não se chama, assim acabando com o loop!</p>

``` lang="golang"
package Base

import "fmt"

func Contagem(i int) {
     if i < 3 {
        return
     }
    ....
``` 
## Caso recursivo

<p>Parte que chama a própria função, fazendo com que a recursão aconteça de fato!</p>

```
   ....
   Contagem(i - 1)
}

func main() {
    Contagem(3)
}
``` 
<a href="./contagem regressiva.py">código completo em python</a>
<a href="./contagem.go">código completo go</a>

## pilha de chamada (Call stack)

<p> Uma estrutura de dados simples, e que é ultilizada por baixo do pano pelas linguagens de programação, Ou em algumas pelo menos. Uma pilha é semelhante a um array, mas existe apenas duas ações que uma pilha é capaz de fazer. </p> 
<p>A de ler o primeiro elemento da pilha e removelo logo em seguida e o de adicionar um elemento a pilha na frente dos demais elementos. Bem mais simples que um array na verdade.</p> <p>Quando usamos recursão usamos call stack, imagina que estamos jogando um jogo de empilhar blocos, cada bloco que colocamos na pilha é uma chamada de função:</p>

```
package main

import "fmt"

func saude(name string) {
    fmt.Printf("olá, %s!", name)

    saude2(name)

    tchau(name)

    fmt.Println("fim!)

}
```

<p>A função saude é a primeira instrução a ser carregada e é criado um "bloco" para</p>
a chamada dela, digamos que como parâmetro de saude usamos Andrezza.
O valor como de andrezza que foi passado como  argumento será alocada nesse
"bloco" da função saude e vamos para o próximo comando: 
`fmt.Printf("olá, %s! \n", name)` e no terminal é impresso "olá, Andrezza!" e partimos para a proxima instrução: `saude2(name)` :

```

....
func saude2(name string) {
    fmt.Printf("seja bem vindo(a), %s \n", name)
}
``` 

<p>
    A mesma coisa irá acontecer com a chamada da função saude2() , um  NOVO bloco
    irá ser empilhado logo após o bloco da chamada de função de `saude()`, e os 
    valores da chamada de funçao `<code>saude2()</code>` serão alocadas na memoria. E o que estiver
    na função `saude2()` irá ser executado:
</p>
<p>
    `fmt.Printf("seja bem vindo(a), %s \n", name)` será executado e a saída do terminal
    irá ser impresso: "seja bem vindo(a), Andrezza", não há mais nada a ser executado,
    e agora? a pilha dessa chamada de função será "derrubada" e voltaremos ao bloco da chamada de função `saude()`.
</p>
<p>
    Que permaneceu em um estado de semi completa! Esse processo iria ocorrer por todas
    chamadas de funções e quando não houvesse mais nada a ser executado a pilha de chamada `saude()` irá ser derrubada evetualmente.
</p>

