
array = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]

def BinarySearch(item: int, lista: list) -> int | None:
    inicio = 0
    final = len(array) - 1
    
    while inicio <= final:
        meioDoArray = int((inicio + final) / 2)

        chuteOItem = lista[meioDoArray]

        if (chuteOItem == item):
            return meioDoArray
        
        if (chuteOItem > item):
            final = meioDoArray - 1
        else:
            inicio = meioDoArray + 1
        
    return None

print(BinarySearch(8, array))
indice = BinarySearch(8, array)
if indice:
    print(array[indice])
