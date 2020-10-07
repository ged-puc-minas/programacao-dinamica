# Recapitulando a Aula 1

Para fins de consulta, abaixo você encontra os códigos utilizados na Aula 1.

Material de referência para princípios básicos do R (em inglês): [Capitulo 4 do livro "R for data Science"](http://r4ds.had.co.nz/workflow-basics.html).

```r
# -----------------------------------------------------------------------------
# GRUPO GED PUC MINAS
# -----------------------------------------------------------------------------

#### R como calculadora

##### Adicao
1 + 1 
1 + 1  + 1
45 + 68
(4+4) + 60
4 + 34.5
.00000001 + .01
.021 + 87

##### Subtracao
25 - 2
8 - 5
(4+4) - 60

##### Multiplicacao
6*5
(4 + 5)*6
4 + (5*6)

##### Divisao
250/25
(4 + 2)/3
4 + 2/3
10/3

#### Resto de divisao
10%%3

## #Potencia
2^10

#Raiz quadrada
sqrt(100)

#Quaisquer outras raizes
8^(1/3) #raiz cubica

# Exponencial (e^x)
exp(1) 
exp(2) 

# Logaritmo natural (base e)
log(4)
log(exp(1))

# Logaritmo em qualquer base
log(4)/log(10) # log de quatro na base 10

# Uso de parentesis
1 + 3/4 + sqrt(65)
(1 + 3)/4 + sqrt(65)
1 + 3/(4 + sqrt(65))
(1 + 3)/(4 + sqrt(65))

############################################
#### Obtendo ajuda: help

# Para saber mais sobre uma funÃ§Ã£o e sua utilizaÃ§Ã£o, consulte-a no arquivo de ajuda
help(sqrt)
help(log)

# HÃ¡ uma forma ainda mais fÃ¡cil de fazer isso: simplesmente anteceda o nome da funÃ§Ã£o com
# uma interrogaÃ§Ã£o
?sqrt

# DICA: Quando erros ocorrem, especialmente com funcoes, a melhor coisa
# a se fazer Ã© pedir ajuda. 
exp("a")

?exp  
# A razÃ£o para o erro Ã© essa:
#       "x	a numeric or complex vector."
# 
# Como introduzimos algo nÃ£o numÃ©rico dentro da funÃ§Ã£o, nÃ£o hÃ¡ como calcular a exponencial

############################################
#### Objetos (parte 1)

# Podemos guardar informacoes e resultados dentro de "objetos". Ou seja, objetos
# sao como "recipientes" de informacoes (de qualquer tipo). Podemos salvar o 
# numero 2 dentro de um objeto chamado "x". Para isso simplesmente dizemos que 
# x = 2. Depois, para recuperar a informacao guardada dentro desse objeto, basta
# digitar seu nome e pressionar ENTER:
        
x = 2
y = 3
print(x)
x #auto-printing
# Podemos ler a linha de comando acima de duas maneiras:
# -- atribuimos o valor 1 ao vetor "a"
# -- "a" recebe 1

# O operador de atribuicao tambem pode ser representado como <- 
x <- 5
x

# Objetos podem guardar resultados:
y = 4 + 5
y

# E podemos produzir novos resultados combinando objetos. Definimos que x=2 e 
# y=9. Logo, y-x deve ser 4 (pois atribuimos x <- 5 logo acima).
y-x

# E a operaÃ§Ã£o realizada entre dois objetos pode ser ainda guardada num terceiro:
w = x - y

# Um objeto pode ser uma cÃ³pia de outro, inclusive:
z = w

############################################
#### Listando e removendo objetos existentes

# ls() ? o comando que lista os objetos que existem na mem?ria do R
ls()

# rm() ? o comando que remove da mem?ria os objetos existente. Mas 
# ? preciso nomear os objetos a serem deletados
rm(z)

# Mas podemos remover v?rios objetos de uma s? vez
rm(x, y, w)

# Ou remover TUDO o que houver... 
rm(list=ls())

############################################
### ESTILO (1): Dando nomes aos objetos

# Na nomeacao de objetos Ã© preciso evitar:
# - Nomes que jÃ¡ sÃ£o utilizados por alguma funcao: e.g. rm <- 1
# - Nomes que comecam por numero: 1x <- 1
# - Nomes que comecam com caracteres especiais: _a <- 1 ou .1 <- 1
# - Nomes com espaco: meu objeto <- 1
# - Tambem Ã© boa pratica nao usar letras maiusculas porque o R Ã© case sensitive.

############################################
### ESTILO (2): Dicas para a escrita do cÃ³digo

# Para manter a legibilidade do codigo, Ã© interessante inserir espacos
# entre argumentos, objetos e parametros. Exemplos:

x<-1 # Ruim
x <- 1 # Bom

2*1+4+2 # Ruim
2 * 1 + 4 + 2 # Bom

x+x+sum(x,x,na.rm=TRUE) # Ruim
x + x + sum(x, x, na.rm = TRUE) # Bom

# Tambem Ã© recomendÃ¡vel usar _ para espacar nomes dos objetos
meuobjeto <- 1 # Ruim
meu_objeto <- 1 # Bom

# E evitar acentos e caracters especiais, mesmo nos comentarios (porque pode abrir de 
# forma errada em outros computadores):

aÃ§Ã£o <- 1 # Ruim
acao <- 1 # bom

# Por fim, uma boa pratica Ã© sempre pular uma linha entre codigos diferentes,
# do mesmo modo como este codigo esta organizado: cada bloco de codigo esta
# separado por dois espacos.

############################################
#### Vetores (Parte 1)

##### Definicoes basicas

# Objetos podem guardar mais de uma informacao ao mesmo tempo. Para isso, devemos
# utilizar a funcao c(). **Funcoes sao comandos que tem o formato: funcao(). 
# Requerem "inputs" (argumentos) e produzem um output ou resultado**. A funcao 
# c() sera o primeiro comando desse tipo que utilizaremos. Sua sintaxe e como se
# segue:
        
c(1,2,3,4,5,6)

# c() significa "combine". Com essa funcao, combinamos diversos valores num unico
# objeto, mais complexo, chamado **vetor**. Agora, _x_ sera um vetor que recebe 
# os valores 1,2,3,4,5,6. 

x = c(1,2,3,4,5,6)
x

# E podemos fazer operacoes com vetores normalmente:
x = c(1 , 2 , 9 , 4 , 5 , 6)
y = c(2,2,2,2,2,2)
z = matrix(y,ncol = 1, nrow = 6)
w = matrix(y,ncol = 6, nrow = 1)

x+y #soma elemento-a-elemento
x-y #substracao elemento-a-elemento
x*y #multiplicacao elemento-a-elemento
x/y #divisao elemento-a-elemento

x %*% y # produto escalar
x %*% t(y)
x %*% z
x %*% w

x[3]
x[c(1,3)]
x[-c(1:3)]
# Para verificar o numero de componentes de um vetor, usamos a funcao **length**
length(x)
length(x + y)

z <- x + y
z
length(z)

# Podemos tambem atribuir nomes aos componentes
b = c(24,29,22)
b
names(b)
names(b) = c("Aluno 1","Aluno 2","Aluno 3")
b
names(b)
length(b)

### Dizemos que "names" a um atributo do vetor b
# Os nomes podem ser conferindo no proprio momento da criacao do vetor
alunos <- c(Aluno1 = 25, Aluno2 = 22, Aluno3 = 21 )
alunos

# Posso combinar vetores (e nao apenas valores...)
alunos2 <- c(Aluno4 = 32, Aluno5 = 28, Aluno6 = 27)
alunos2

c(alunos,alunos2)

alunos <- c(alunos,alunos2)
alunos
```