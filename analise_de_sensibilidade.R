# Parametros

S = 3  # num de estados
A = 2  # num de acoes


# Criar Matrizes de Probabilidade

valores_probabilidade_nada = c(c(0.2, 0.7, 0.1), c(0, 0.6, 0.4), c(0, 0, 1))
probabilidade_nada = matrix(valores_probabilidade_nada, ncol = 3, nrow = 3, byrow = TRUE)

valores_probabilidade_troca = c(c(1, 0, 0), c(1, 0, 0), c(1, 0, 0))
probabilidade_troca = matrix(valores_probabilidade_troca, ncol = 3, nrow = 3, byrow = TRUE)


# Criar Matrizes de Custo

valores_custo_nada = c(c(0, 0, 0), c(0, 0, 0), c(0, 0, 0))
custo_nada = matrix(valores_custo_nada, ncol = 3, nrow = 3, byrow = TRUE)
custo_nada = -custo_nada

valores_custo_troca = c(c(400, 0, 0), c(500, 0, 0), c(600, 0, 0))
custo_troca = matrix(valores_custo_troca, ncol = 3, nrow = 3, byrow = TRUE)
custo_troca = -custo_troca


# Nomear linhas e colunas das matrizes

nomes = c("Na", "Ra", "Ru")

dimnames(probabilidade_nada) <- list(nomes, nomes)
dimnames(probabilidade_troca) <- list(nomes, nomes)
dimnames(custo_nada) <- list(nomes, nomes)
dimnames(custo_troca) <- list(nomes, nomes)


# Array de matrizes de probabilidade e custo

P_ija = array(c(probabilidade_nada, probabilidade_troca), dim = c(S,S,A))
C_ija = array(c(custo_nada, custo_troca), dim = c(S,S,A))


# Lucro

Lj = c(1000, 700, 300)


# Iteracao de Valor
lambda = 0.995
iteracoes = 52

V = matrix(0L, nrow = iteracoes, ncol = S)
OPCAO = matrix(0L, nrow = iteracoes, ncol = S)  # A
OPCAO_nome = matrix(0L, nrow = iteracoes, ncol = S)  # A_nome

# OPCAO = matrix(0L, nrow = iteracoes, ncol = A)
# OPCAO_nome = matrix(0L, nrow = iteracoes, ncol = A)

for(k in 2:iteracoes) {

  CE = matrix(nrow = S, ncol = A)
  dimnames(CE) <- list(c("No", "Ra", "Ru"), c("nada", "troca"))

  for(i in 1:S) {
    for(a in 1:A) {
      CE[i,a] = sum(P_ija[i,,a] * (C_ija[i,,a] + Lj + lambda*V[k-1,]))
    }

    V[k,i] = max(CE[i,])

    OPCAO[k,i] = which.max(CE[i,])
    OPCAO_nome[k,i] = names(which.max(CE[i,]))
  }
}


# Analise de sensibilidade

incrementos = seq(from = -200, to = 500, by = 10)
sensibilidade = matrix(0L, nrow = length(incrementos), ncol = S)
dimnames(sensibilidade) <- list(incrementos, c("No", "Ra", "Ru"))

for (k in 1:length(incrementos)) {
  incremento = incrementos[k]

  C_ija_sens = C_ija
  C_ija_sens[,1,2] = C_ija_sens[,1,2] + c(-incremento,-incremento,-incremento)

  # Iteracao
  CE = matrix(nrow = S, ncol = A)
  dimnames(CE) <- list(c("No", "Ra", "Ru"), c("nada", "troca"))

  for(i in 1:S) {
    for(a in 1:A) {
      CE[i,a] = sum(P_ija[i,,a] * (C_ija_sens[i,,a] + Lj + lambda*V[iteracoes-1,]))
    }

    sensibilidade[k,i] = names(which.max(CE[i,]))
  }
}


# Imprimir
# print(CE)
# print(V)
# print(OPCAO)
# print(OPCAO_nome)
