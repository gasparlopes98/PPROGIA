#1)
import string

def macaco_sarilhos(a):
    return  lambda b: (True if (a == b) else False)

#2)
def falta_caractere(string):
    if(string==""):
        return "String vazia"
    else:
        return lambda num: "Índice inválido" if (len(string)<num) else string[:num]+string[num+1:]

#3)
def conta_7(lista):
    string= ' '.join(map(str,lista))
    return string.count('7')


#4)    
def inverte(list):
    return (list[::-1])
            
#5)
def flat_list_FC(lista,i,flat):
    if(i>=len(lista)):
        return flat
    if type(lista[i]) is list:
        flat= flat_list_FC(lista[i],0,flat)
        return flat_list_FC(lista,i+1,flat)
    else:
        flat.append(lista[i])
        return flat_list_FC(lista,i+1,flat)

#6)
def query_notas_lambda(d,n,nl):
    lk= inverte(list(d.keys()))
    lv= inverte(list(d.values()))
    if(lk==[]):
        return nl
    elif(lv[0]==n):
        nl.append(lk[0])
        d.popitem()
        return query_notas_lambda(d,n,nl)
    else:
        d.popitem()
        return query_notas_lambda(d,n,nl)

#7.1)
def format_txt(i,nova_lista,lista):
    if i == len(lista):
        return nova_lista
    else:
        nova_lista.append(lista[i].replace("_"," ").title())
        return format_txt(i+1,nova_lista,lista)

#7.2)
def nice_print_lambda(i,lista):
    if i == len(lista):
        return print(' '.join(map(str,lista)))
    else:
        lista[i]=lista[i][0].ljust(20) + str(lista[i][1]).ljust(10)+ str(lista[i][2]) + "\n"
        return nice_print_lambda(i+1,lista)
    
#np = lambda nl,lista,i: np(nl.join(map(str,lista[i][0].ljust(20) + str(lista[i][1]).ljust(10)+ str(lista[i][2])+"\n")),lista,i+1) if i< len(lista) else print(nl)
#np = lambda i,lista: np(i+1,lista[i]=lista[i][0].ljust(20) + str(lista[i][1]).ljust(10)+ str(lista[i][2])+"\n") if i< len(lista) else print(' '.join(map(str,lista)))

#np("",base_dados,0)
#np(0,base_dados)

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

#print(macaco_sarilhos("sorri")("sorri"))
#print(falta_caractere("Hello")(2))
#print(conta_7(lista_elementos))
#print(inverte(lista_elementos))
#print(flat_list_FC(lista_de_lista,0,[]))
print(query_notas_lambda(dicionario,4,[]))
#print(format_txt(0,[],base_dados[0]))
#base_dados[0]=format_txt(0,[],base_dados[0])
#nice_print_lambda(0,base_dados)

