#1)
import string


def macaco_sarilhos(a,b):
    return  (True if (a == b) else False)

#2)
def falta_caractere(string,num):
    if(string==""):
        return print("String vazia")
    elif(len(string)<num):
        return print("Índice inválido")
    else:
        string=string[0:num]+string[(num+1):len(string)]
        return string

#3)
def conta_7(list):
    string= ' '.join(map(str,list))
    return string.count('7')

#4)    
def inverte(list):
    return (list[::-1])
            
#5)
def flat_list(lista):
    flat = []
    for elemento in lista:
        if type(elemento) is list:
            for item in elemento:
                flat.append(item)
        else:
            flat.append(elemento)
    return flat

#6)
def query_notas(d,n=4):
    lista_nomes=[]
    for person in d:
        if d[person]==n:
            lista_nomes.append(person)
    return lista_nomes

#7.1)
def format_txt(lista):
    nova_lista=[]
    for elemento in lista:
        elemento=elemento.replace("_"," ")
        elemento=elemento.title()
        nova_lista.append(elemento)
    return nova_lista   

#7.2)
def nice_print(lista):
    for sublista in lista:
        print(sublista[0].ljust(20) + str(sublista[1]).ljust(10)+ str(sublista[2]))
    
a, b = "a_sorri", "b_sorri"
lista_elementos=[1,7,22,7,'hello',5,7,13]
lista_de_lista = ['lamp_hall_1', 
                  'lamp_hall_2', 
                  ['lamp_sala_1', 'lamp_sala_2', 'lamp_sala_3'], 
                  ['lamp_cozinha_1','lamp_cozinha_2'], 
                  ['lamp_quarto_1'], 
                  ['lamp_banho_2']]

dicionario= {'João':3, 'Diogo':4, 'Ana':4, 'Catarina':4, 
             'Francisco':3, 'Joana':5, 'Filipe':2, 'Manuel':5}

base_dados= [['nome_de_utilizador', 'idade', 'peso'],['Rui',18,75], ['Pedro',28,82],['Mafalda',33,53]]

#print(macaco_sarilhos(a,b))
#print(falta_caractere("Hello",2))
#print(conta_7(lista_elementos))
#print(inverte(lista_elementos))
#print(flat_list(lista_de_lista))
#print(query_notas(dicionario,4))
#print(format_txt(base_dados[0]))
base_dados[0]=format_txt(base_dados[0])
nice_print(base_dados)
