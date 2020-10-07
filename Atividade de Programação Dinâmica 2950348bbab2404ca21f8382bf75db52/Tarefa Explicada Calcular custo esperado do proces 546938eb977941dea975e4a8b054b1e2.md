# Tarefa Explicada: Calcular custo esperado do processo estocástico

# Tarefa

A tarefa inicial é reproduzir a rotina para estimar o custo futuro esperado caso o usuário realize cada ação.

![Tarefa%20Explicada%20Calcular%20custo%20esperado%20do%20proces%20546938eb977941dea975e4a8b054b1e2/WhatsApp_Image_2020-09-03_at_15.04.08.jpeg](Tarefa%20Explicada%20Calcular%20custo%20esperado%20do%20proces%20546938eb977941dea975e4a8b054b1e2/WhatsApp_Image_2020-09-03_at_15.04.08.jpeg)

# Solução

Para esta solução, será utilizado como base o código da [aula anterior](https://www.notion.so/Tarefa-Explicada-Criar-matrizes-do-processo-estoc-stico-cd0c680107644d2e899787bf305c0815#935489b4e1054546b9f6fff99be7bc01). A única diferença é que substituiremos, nas matrizes, todos os campos que continham `NA` por `0`, para evitar problemas no cálculo.

## Criando um array com as matrizes

Para juntar as matrizes, será necessário usar o comando `list`.

```r
# Array de matrizes de probabilidade e custo

P_ija = list(probabilidade_nada, probabilidade_troca)
C_ija = list(custo_nada, custo_troca)
```

Neste caso, é melhor utilizar o comando `list` ao invés de `array` porque ele vai facilitar a iteração dentro do for.

## Criar vetor de lucro

Lucro referente a cada estado.

```r
Lj = c(1000, 700, 300)
```

## Calcular custo esperado

Para calcular o custo esperado, utilizaremos o algoritmo fornecido na imagem acima.

```r
# Cálculo do custo esperado

num_estados = length(P_ija[[1]][,1])
num_acoes = length(P_ija)

custo_esperado = matrix(nrow = num_estados, ncol = num_acoes)

for(i in 1:num_estados) {
  for(a in 1:num_acoes) {

    custo_esperado_ia = 0
    for(j in 1:num_estados) {
      custo_esperado_ia = custo_esperado_ia + (P_ija[[a]][i,j] * (C_ija[[a]][i,j] + Lj[j]))
    }

    custo_esperado[i,a] = custo_esperado_ia

  }
}
```

## Nomear linhas e colunas

Para facilitar a leitura da matriz resultante, colocaremos nomes nas linhas e colunas dessa matriz.

```r
dimnames(custo_esperado) <- list(c("Na", "Ra", "Ru"), c("nada", "troca"))
```

# Código Final da Solução

Abaixo, você confere o código completo para criar as matrizes do processo estocástico e calcular o custo esperado.

```r
# Criar Matrizes de Probabilidade

valores_probabilidade_nada = c(c(0.2, 0.7, 0.1), c(0, 0.6, 0.4), c(0, 0, 1))
probabilidade_nada = matrix(valores_probabilidade_nada, ncol = 3, nrow = 3, byrow = TRUE)

valores_probabilidade_troca = c(c(1, 0, 0), c(1, 0, 0), c(1, 0, 0))
probabilidade_troca = matrix(valores_probabilidade_troca, ncol = 3, nrow = 3, byrow = TRUE)

# Criar Matrizes de Custo

valores_custo_nada = c(c(0, 0, 0), c(0, 0, 0), c(0, 0, 0))
custo_nada = matrix(valores_custo_nada, ncol = 3, nrow = 3, byrow = TRUE)
custo_nada = -custo_nada

valores_custo_troca = c(c(300, 0, 0), c(500, 0, 0), c(900, 0, 0))
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

# Vetor de lucro

Lj = c(1000, 700, 300)

# Cálculo do custo esperado

num_estados = length(P_ija[[1]][,1])
num_acoes = length(P_ija)

custo_esperado = matrix(nrow = num_estados, ncol = num_acoes)

for(i in 1:num_estados) {
  for(a in 1:num_acoes) {

    custo_esperado_ia = 0
    for(j in 1:num_estados) {
      custo_esperado_ia = custo_esperado_ia + (P_ija[[a]][i,j] * (C_ija[[a]][i,j] + Lj[j]))
    }

    custo_esperado[i,a] = custo_esperado_ia

  }
}

# Nomear linhas e colunas da matriz de custo esperado

dimnames(custo_esperado) <- list(c("Na", "Ra", "Ru"), c("nada", "troca"))
```