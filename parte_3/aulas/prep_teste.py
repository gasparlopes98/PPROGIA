
from functools import reduce

data=[{'Matematica':{'Joao':2, 'Filipe':5, 'Cristiva':4, 'Sara':3, 'Luis':4}},
      {'Biografia':{'Joao':3, 'Filipe':2, 'Cristiva':4, 'Sara':5, 'Luis':3}},
      {'Fisica':{'João':3, 'Filipe':2, 'Cristiva':3, 'Sara':4, 'Luis':5}}]

alfabeto=['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z']

def retorna3 (d_list, uni_curr,nota):
    return [aluno for d in d_list for uc in d for aluno in d[uc] if d[uc][aluno]<= nota and uc == uni_curr]
    #return list(filter(lambda x: x,list(map(lambda x: x==uni_curr ,data))))

def impar(lista):
    return list(map(lambda y: str(y)+"-impar", filter(lambda x: x%2 != 0,lista)))
    #return [str(x)+'-impar' for x in lista if x%2 !=0]
    
def code(palavra):
    return '#'.join(map(lambda x: str(alfabeto.index(x.upper())+1),palavra))
    # return '#'.join([str(alfabeto.index(i+1) for i in palavra.upper())])

def encontra(lista,n):
    return list(map(lambda x: x*x,list(filter(lambda x : x==n ,lista))))

def red_pares(lista):
    return reduce(lambda x,y: x*y,filter(lambda x: x%2==0,lista))
    
def inverso_R(d):
    return list(map(lambda x: str(x[::-1].upper()),filter(lambda x: x.upper().find('R')>-1 ,d)))

def naturais(n):
    return list(map(lambda x: x*x,range(n,0,-1)))
    
mapping={'a':1,'e':2,'i':3,'o':4,'u':5,'A':11,'E':22,'I':33,'O':44,'U':55}
def sub(frase):
    return "".join(map(lambda x: str(mapping[x]) if x in mapping else str(x),frase))
#print(retorna3(data,"Matematica",3))
# print(impar([1, 2, 3, 4, 25, 32]))
# print(code('benfica'))
# print(encontra([1,45,6,4,3,5,3,2],3))
# print(red_pares([2,1,7,1,5,7,9,6]))
# print(inverso_R(['Ricardo', 'Helder', 'Fernandes', 'João', 'Claudia', 'Ana', 'Ines']))
# print(naturais(7))
print(sub("Importante encontrar o erro!"))