# Tarefa Explicada: Criar matrizes do processo estocástico

# Contextualização

Na atividade da Profª. Lívia, foi apresentado um processo estocástico para a tomada de decisões durante a pandemia de COVID-19.

![Tarefa%20Explicada%20Criar%20matrizes%20do%20processo%20estoca%20cd0c680107644d2e899787bf305c0815/WhatsApp_Image_2020-08-20_at_15.32.00.jpeg](Tarefa%20Explicada%20Criar%20matrizes%20do%20processo%20estoca%20cd0c680107644d2e899787bf305c0815/WhatsApp_Image_2020-08-20_at_15.32.00.jpeg)

Folha com a contextualização do processo estocástico

# Tarefa

A tarefa inicial é criar, no R, matrizes semelhantes às apresentadas na imagem ao lado.

Para facilitar a visualização, as matrizes da imagem estão listadas abaixo.

![Tarefa%20Explicada%20Criar%20matrizes%20do%20processo%20estoca%20cd0c680107644d2e899787bf305c0815/WhatsApp_Image_2020-08-20_at_15.25.08.jpeg](Tarefa%20Explicada%20Criar%20matrizes%20do%20processo%20estoca%20cd0c680107644d2e899787bf305c0815/WhatsApp_Image_2020-08-20_at_15.25.08.jpeg)

Folha com os estados e as matrizes do processo estocástico

### Matrizes de Probabilidade

Probabilidade de mudar de um estado (linha) para outro estado (coluna) dada a escolha do usuário.

$$P_{ij}^{(nada)} =

\begin{array}{c|ccc}
 & N_O & R_A & R_U \\
\hline
N_O & 0,2 & 0,7 & 0,1 \\
R_A & 0 & 0,6 & 0,4 \\
R_U & 0 & 0 & 1
\end{array}$$

$$P_{ij}^{(troca)} =

\begin{array}{c|ccc}
 & N_O & R_A & R_U \\
\hline
N_O & 1 & 0 & 0 \\
R_A & 1 & 0 & 0 \\
R_U & 1 & 0 & 0
\end{array}$$

### Matrizes de Custo

Custo de realizar a transição de estado dada a escolha do usuário.

$$C_{ij}^{(nada)} =

\begin{array}{c|ccc}
 & N_O & R_A & R_U \\
\hline
N_O & \$0 & \$0 & \$0 \\
R_A & N\!A & \$0 & \$0 \\
R_U & N\!A & N\!A & \$0
\end{array}$$

$$C_{ij}^{(troca)} =

\begin{array}{c|ccc}
 & N_O & R_A & R_U \\
\hline
N_O & \$300 & N\!A & N\!A \\
R_A & \$500 & N\!A & N\!A \\
R_U & \$600 & N\!A & N\!A
\end{array}$$

# Explicação da Solução

Antes de olhar a solução, tente fazer você mesmo a tarefa utilizando o que foi ensinado na seção sobre [Arrays e Matrizes](https://www.notion.so/Arrays-e-Matrizes-a386fd3614d844c4a66870e8c8e5ad83).

## Matrizes de Probabilidade

Primeiramente, iremos primeiro criar um array com os valores que serão colocados na matriz. Depois, iremos criar a matriz utilizando esse array.

```r
# Matriz de Probabilidade se usuário escolher nada
valores_probabilidade_nada = c(c(0.2, 0.7, 0.1), c(0, 0.6, 0.4), c(0, 0, 1))
probabilidade_nada = matrix(valores_probabilidade_nada, ncol = 3, nrow = 3, byrow = TRUE)

# Matriz de Probabilidade se usuário escolher troca
valores_probabilidade_troca = c(c(1, 0, 0), c(1, 0, 0), c(1, 0, 0))
probabilidade_troca = matrix(valores_probabilidade_troca, ncol = 3, nrow = 3, byrow = TRUE)
```

## Matrizes de Custo

Para as matrizes de custo, seguiremos o mesmo processo. Porém, colocaremos o valor `NA` (vazio) nos campos em que não acontecem transição.

```r
# Matriz de Custo se usuário escolher nada
valores_custo_nada = c(c(0, 0, 0), c(NA, 0, 0), c(NA, NA, 0))
custo_nada = matrix(valores_custo_nada, ncol = 3, nrow = 3, byrow = TRUE)
custo_nada = -custo_nada

# Matriz de Custo se usuário escolher troca
valores_custo_troca = c(c(300, NA, NA), c(500, NA, NA), c(900, NA, NA))
custo_troca = matrix(valores_custo_troca, ncol = 3, nrow = 3, byrow = TRUE)
custo_troca = -custo_troca
```

`NA` é um tipo de valor vazio que indica um valor que está faltando. Outros tipos de valores vazios são `NULL` e `NaN` (cada um com suas particularidades).

## Colocando nomes nas linhas e colunas

Como os nomes das linhas e colunas são iguais, vamos criar apenas uma variável para os nomes. Depois, vamos configurar o `dimnames` para cada matriz.

```r
nomes = c("Na", "Ra", "Ru")

dimnames(probabilidade_nada) <- list(nomes, nomes)
dimnames(probabilidade_troca) <- list(nomes, nomes)
dimnames(custo_nada) <- list(nomes, nomes)
dimnames(custo_troca) <- list(nomes, nomes)
```

## Imprimindo as matrizes

Após executar todos os passos acima, as matrizes devem apresentar resultados semelhantes aos apresentados abaixo:

```r
> print(probabilidade_nada)
    Na  Ra  Ru
Na 0.2 0.7 0.1
Ra 0.0 0.6 0.4
Ru 0.0 0.0 1.0

> print(probabilidade_troca)
   Na Ra Ru
Na  1  0  0
Ra  1  0  0
Ru  1  0  0

> print(custo_nada)
   Na Ra Ru
Na  0  0  0
Ra NA  0  0
Ru NA NA  0

> print(custo_troca)
    Na Ra Ru
Na 300 NA NA
Ra 500 NA NA
Ru 900 NA NA
```

## Criando um array com as matrizes

Para juntar as matrizes, será necessário usar o comando `list`.

```r
# Array de matrizes de probabilidade e custo

P_ija = list(probabilidade_nada, probabilidade_troca)
C_ija = list(custo_nada, custo_troca)
```

# Código Final da Solução

Abaixo, você confere o código completo para criar as matrizes do processo estocástico.

```r
# Criar Matrizes de Probabilidade

valores_probabilidade_nada = c(c(0.2, 0.7, 0.1), c(0, 0.6, 0.4), c(0, 0, 1))
probabilidade_nada = matrix(valores_probabilidade_nada, ncol = 3, nrow = 3, byrow = TRUE)

valores_probabilidade_troca = c(c(1, 0, 0), c(1, 0, 0), c(1, 0, 0))
probabilidade_troca = matrix(valores_probabilidade_troca, ncol = 3, nrow = 3, byrow = TRUE)

# Criar Matrizes de Custo

valores_custo_nada = c(c(0, 0, 0), c(NA, 0, 0), c(NA, NA, 0))
custo_nada = matrix(valores_custo_nada, ncol = 3, nrow = 3, byrow = TRUE)
custo_nada = -custo_nada

valores_custo_troca = c(c(300, NA, NA), c(500, NA, NA), c(900, NA, NA))
custo_troca = matrix(valores_custo_troca, ncol = 3, nrow = 3, byrow = TRUE)
custo_troca = -custo_troca

# Nomear linhas e colunas das matrizes

nomes = c("Na", "Ra", "Ru")

dimnames(probabilidade_nada) <- list(nomes, nomes)
dimnames(probabilidade_troca) <- list(nomes, nomes)
dimnames(custo_nada) <- list(nomes, nomes)
dimnames(custo_troca) <- list(nomes, nomes)

# Array de matrizes de probabilidade e custo

P_ija = list(probabilidade_nada, probabilidade_troca)
C_ija = list(custo_nada, custo_troca)
```