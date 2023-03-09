Algoritmo "Jogo da velha"
// Disciplina   : [Linguagem e Lógica de Programação]
// Professor   : -------------
// Descrição   : Jogo da Velha
// Autor(a)    : Rafaeru.png
// Data atual  : 02/03/2023
Var
// Seção de Declarações das variáveis 
 jogo : VETOR [1..3,1..3] DE CARACTER
 l,c,linha,coluna,jogador,ganhou,jogadas,opcao  : INTEIRO

procedimento inicializarJogo()
inicio
 // Inicializar a Matriz
para l de 1 ate 3 faca
     para c de 1 ate 3 faca
     jogo[l,c] <- "  "
     fimpara
fimpara
//Inicializar o Jogador
 jogador <- 1
//Inicializar Ganhou
 ganhou <- 0
//Inicializar Jogadas
 jogadas <- 0
fimprocedimento

procedimento impressaoTabuleiro()
inicio
   Escreval
   Escreval("  1    2    3")
   para l de 1 ate 3 faca
        para c de 1 ate 3 faca
        escreva(" ",jogo[l,c])
        se(c<3)entao
        escreva(" | ")
        fimse
        se(c=3)entao
         escreva(" ",l)
        fimse

        fimpara
        se(l<3)então
        escreval
        escreval("---------------")
        fimse
   fimpara
fimprocedimento

procedimento  lerJogada(jogador:inteiro)
inicio
   repita
      repita
          escreval
          Escreval("Jogador ",jogador," digite a linha e a Coluna desejada?")
          Leia(linha,coluna)
      ate((linha<=3)E(linha>=1)E(coluna<=3)E(coluna>=1))
   ate((jogo[linha,coluna]) = "  "))
fimprocedimento

funcao atualizarJogador(jogador:inteiro) :inteiro
inicio
 se(jogador = 1) entao
 jogador <- 2
 senao
 jogador <- 1
 fimse
 retorne jogador
fimfuncao

funcao salvarJogada(jogador:inteiro)  :inteiro
inicio
   se(jogador =1)entao
    jogo[linha,coluna] <- "0"
   senao
    jogo[linha,coluna] <- "X"
   fimse
   retorne 1
fimfuncao

funcao ganhouPorLinha(j :caracter) : inteiro
inicio
   para l de 1 ate 3 faca
      se (jogo[l,1]= j)E(jogo[l,2]= j)E(jogo[l,3]= j)entao
      retorne 1 // Jogador GAnhou
      interrompa
      senão
      retorne 0 //ninguem Ganhou
      fimse
   fimpara
fimfuncao

funcao ganhouPorLinhas( ) :inteiro
inicio
    se (ganhouPorLinha("0")= 1)entao
       retorne 1  //JOgador 1 Ganhou
    senao
    se (ganhouPorLinha("X") = 1) entao
      retorne 2  //JOgador 2 Ganhou
    senao
   retorne 0 //NEnhum JOgador Ganhou
   fimse
   fimse
fimfuncao

funcao ganhouPorColuna (j :caracter) : inteiro
inicio
 para c de 1 ate 3 faca
      se (jogo[1,c]=j)E(jogo[2,c]=j)E(jogo[3,c]=j)entao
      retorne 1 //jogador Ganhou
      interrompa
      senao
      retorne 0 //ninguem Ganhou
      fimse
 fimpara

fimfuncao

funcao ganhouPorColunas () :inteiro
inicio
   se (ganhouPorColuna("0")) = 1 entao
       retorne 1  //JOgador 1 VEnceu
   senao
   se (ganhouPorColuna("X")) = 1 entao
       retorne 2 //JOgador 2 Venceu
   senao
       retorne 0 //Ninguem Venceu
   fimse
   fimse
fimfuncao

funcao ganhouNaDiagPrincipal( j :caracter) : inteiro
inicio
 se((jogo[1,1]=j)E(jogo[2,2]=j)E(jogo[3,3]=j)) entao
    retorne 1
    interrompa
    senao
    retorne 0
 fimse
fimfuncao

funcao ganhadorDiagPrincipal() :inteiro
inicio
   se(ganhouNaDiagPrincipal("0") = 1)entao
       retorne 1
   senao
   se(ganhouNaDiagPrincipal("X") = 1)entao
       retorne 2
   senao
   retorne 0
   fimse
   fimse
fimfuncao

funcao ganhouNaDiagSecundaria(j :caracter) :inteiro
inicio
se((jogo[1,3]=j)E(jogo[2,2]=j)E(jogo[3,1]=j)) entao
   retorne 1
   interrompa
   senao
   retorne 0
fimse
fimfuncao

funcao ganhadorDiagSecundaria() :inteiro
inicio
   se(ganhouNaDiagSecundaria("0") = 1)entao
       retorne 1
   senao
   se(ganhouNaDiagSecundaria("X") = 1)entao
       retorne 2
   senao
   retorne 0
   fimse
   fimse
fimfuncao

funcao jogar(jogador : inteiro; jogadas :inteiro ;ganhou : inteiro) : inteiro
inicio
repita
   // Impressão do Tabuleiro
   impressaoTabuleiro()
   //Ler Jorgada
   lerJogada(jogador)
   //Salvar Jogada
   jogadas <- jogadas + salvarJogada(jogador)
   jogador <- atualizarJogador(jogador)

   //Verificar Ganhdor por Linhas
   ganhou <- ganhouPorLinhas()
   se (ganhou = 0) entao
   //Verificar Ganhador por Colunas
   ganhou <- ganhouPorColunas()
     se (ganhou = 0) entao
      //Verificar Ganhador na diagonal Principal
     ganhou <- ganhadorDiagPrincipal()
       se (ganhou = 0) entao
          //Verficar Ganhador na Diogonal Secundaria
          ganhou <- ganhadorDiagSecundaria()
       fimse
      fimse
    fimse
ate ((ganhou<>0)OU(jogadas=9))
 retorne ganhou
fimfuncao


Inicio
repita
inicializarJogo()
ganhou <- jogar(jogador,jogadas,ganhou)
// Impressão do Tabuleiro
impressaoTabuleiro()
//Mensagem ao GAnhador
escreval
se(Ganhou=1) entao
 escreval("Parabéns Jogador 1 vc Ganhou")
senao
se(Ganhou=2) entao
 escreval("Parabéns Jogador 2 vc Ganhou")
senao
 escreval("EMPATE")
fimse
fimse
escreval("Digite 1 para Jogar novamente!")
leia(opcao)
ate (opcao <> 1)
Fimalgoritmo