from functools import reduce

#1
def triangulo(lista):
    a= list(filter(lambda x: x<(sum(lista)-x),lista))
    return True if len(a)==3 else False

#2
anonimo_mul=lambda x,y: x*y

#3
anonimo_sum=lambda x: x+2 if x>0 else x-2

#4
def soma_natural(n):
    return reduce(lambda x,y: x+y,range(1,n+1))

#5
def quadrado(n):
    return list(map(lambda x: x*x,range(1,n+1)))

#6
def inverte(lista):
    return list(map(lambda x: x,lista[::-1]))

#7
def prod_total(lista):
    return reduce(lambda x,y: x*y,lista)

#8
def encontra(lista,n):
    return len(list(filter(lambda x: x ==n,lista)))

#9
def any_par(lista):
    return any(list(map(lambda x: x%2==0,lista)))

def all_par(lista):
    return all(list(map(lambda x: x%2==0,lista)))

#10
def palindromo(lista):
    return list(filter(lambda x: x==''.join(map(str,inverte(x))),lista))

#11
def vogais(palavra):
    vog=['a','e','i','o','u','A','E','I','O','U']
    return len(list(filter(lambda x: x in vog,palavra)))

#12
def maisQueKVogais(string,k):
    lista = string.split()
    return list(filter(lambda x: vogais(x)>=k, lista))
    
#13
def encriptar_cesar(string,n):
    alfabeto=['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z']
    lista = string.split()
    lista_ind=[]
    lista_fin=[]
    for i in lista:
        lista_ind.append(list(map(lambda x: alfabeto.index(x.upper())+n,i)))
    for j in lista_ind:
        lista_fin.append(''.join(map(str,list(map(lambda x: alfabeto[x] if x < len(alfabeto) else alfabeto[x-len(alfabeto)],j)))))
    return lista_fin


#encriptar_cesar = lambda x,y:["".join([alfabeto[alfabeto.index(char)+y] for char in substring.upper()]) for substring in x.split()]

triag=[6,4,2,2]
coisas = ["ama","asdfgdsf","laal"]
# print(triangulo(triag))
# print(anonimo_mul(2,3))
# print(anonimo_sum(2))
# print(soma_natural(4))
# print(quadrado(4))
# print(coisas[1])
# print(prod_total(triag))
# print(encontra(triag,3))
# print(any_par(triag))
# print(all_par(triag))
# print(palindromo(coisas))
#print(vogais("aijkbnaspo"))
#print(maisQueKVogais("Estava perto da entrada",2))
#print(encriptar_cesar('Benfica Melhor que o Porto',2))
