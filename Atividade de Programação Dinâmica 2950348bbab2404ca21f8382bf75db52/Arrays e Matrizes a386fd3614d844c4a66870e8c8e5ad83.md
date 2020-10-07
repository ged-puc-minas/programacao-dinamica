# Arrays e Matrizes

# Arrays

## Como criar um array no R

Um array é um conjunto sequencial de informações. Por exemplo, na matemática, um array poderia ser representado pela matriz de uma dimensão:

$$\begin{array}{|cccc|}
10 & 14 & 12 & 15
\end{array}$$

Para criar um array semelhante ao apresentado acima na linguagem R, e atrelá-lo a uma variável, você pode utilizar o comando:

```r
lista_de_numeros = c(10, 14, 12, 15)
```

O array criado será atrelado à variável `lista_de_numeros`. Caso você **imprima** essa variável, receberá o seguinte resultado:

```r
[1] 10 14 12 15
```

# Matrizes

## Como criar uma matriz no R

A diferença primordial entre um array e uma matriz no R é que a matriz pode possuir várias dimensões. Além disso, utiliza-se uma sintaxe diferente da utilizada para a criação de um array.

Considere a seguinte matriz:

$$\begin{array}{|ccc|}
1 & 2 & 3 \\
4 & 5 & 6
\end{array}$$

Para criá-la utilizando o R, você pode utilizar o seguinte código:

```r
array = c(1, 2, 3, 4, 5, 6)
matriz_criada = matrix(array, ncol = 3, nrow = 2, byrow = TRUE)

# ncol: Número de Colunas da Matriz
# nrow: Número de Linhas da Matriz
```

No código acima, foram necessárias duas etapas para a criação da matriz:

- Primeiramente, foi criado um array que será utilizado para **preencher os campos da matriz**;
- Logo em seguida, foi criada a matriz.
    - No primeiro campo dentro do parênteses, a variável `array` indica que ela será utilizada para o preenchimento dos valores da matriz.
    - O **número** de **colunas** e **linhas** foram definidos utilizando, respectivamente, as variáveis `ncol` e `nrow`.
    - O parâmetro `byrow = TRUE` indica que os dados do array serão preenchidos da esquerda para a direita.

Caso você **imprima** a variável `matriz_criada`, receberá o seguinte resultado:

```r
     [,1] [,2] [,3]
[1,]    1    2    3
[2,]    4    5    6
```

Esse resultado é semelhante à matriz original apresentada.

Você pode consultar outras formas de criar uma matriz [neste tutorial](https://www.datamentor.io/r-programming/matrix/).

## Nomeando as colunas e linhas

Agora vamos considerar a tabela abaixo:

$$\begin{array}{r|ccc}
 & Belo\;Horizonte & São\;Paulo & Salvador \\
\hline
População\;(milhões) & 1,4 & 12,2 & 2,7 \\
Temperatura\;Média & 20,5 & 18,5 & 25,2
\end{array}$$

Além dos dados, ela também possui algumas informações sobre o significado de cada linha e coluna. No R, é possível nomear as linhas e colunas para obter um resultado semelhante.

Para criar uma tabela semelhante no R, você pode utilizar o seguinte código:

```r
# Criar matriz
populacao = c(1.4, 12.2, 2.7)
temperaturas = c(20.5, 18.5, 25.2)

tabela = matrix(c(populacao, temperaturas), ncol = 3, nrow = 2, byrow = TRUE)

# Nomear linhas e colunas
nomes_colunas = c("Belo Horizonte", "São Paulo", "Salvador")
nomes_linhas = c("População (milhões)", "Temperatura Média")

dimnames(tabela) <- list(nomes_linhas, nomes_colunas)
```

Na primeira parte do código, foi utilizada, novamente, a função matrix para criar uma matriz. A única diferença para o exemplo da seção anterior foi a junção dos arrays `populacao` e `temperaturas` em um único array com o comando `c(populacao, temperaturas)` (isso foi feito com o objetivo de melhorar a visualização do código).

A novidade introduzida nesse código é a função `dimnames`. Com ela, é possível alterar os nomes das linhas e das colunas. No caso do nosso array de duas dimensões, você vai fornecer dois arrays — o primeiro contendo os nomes das colunas e o segundo contendo os nomes das linhas.

Após executado o código, a variável `tabela` possuirá o seguinte resultado:

```r
                    Belo Horizonte São Paulo Salvador
População (milhões)            1.4      12.2      2.7
Temperatura Média             20.5      18.5     25.2
```