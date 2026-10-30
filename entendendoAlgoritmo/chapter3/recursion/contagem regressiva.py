def contagem(i:int) -> None:
    print(i)
    if i <= 0:
        return
    contagem(i - 1)

contagem(3)