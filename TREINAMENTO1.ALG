Algoritmo "treinamento1"
// A meta do treinamento 1 � fazer um programa que simule um caixa eletr�nico
// tendo em vista o uso de estruturas: Sequ�ncial, se/entao/senao, enquanto, repita-ate e
//escolha/caso, tendo em vista que ser� de extrema ajuda voc� descrever a fun��o de cada
// bloco de c�digo com coment�rios para ajudar no entendimento dos mesmos.


Var
   login, password  : caractere
   init, tentativas, operacao, parcelas : inteiro
   deposito, saldo, saque, emprestimo, juros, vTotalParcelado, vTotal : real

Inicio

      escreval("Seja bem-vindo ao Banco Senai!")
      escreval("******************************")
      escreval("Para come�ar seu atendimento digite '1'")
      leia(init)
      
     //Usei a estrutura (enquanto) para que o programa s� termine assim que o usu�rio desejar
     // se for difente de '1'  o programa se encerra.

     enquanto init = 1 faca
         // login  e senha para acessar os servi�os
         escrevaL("DIGITE SEU LONGIN E SENHA PARA ACESSAR SUA CONTA:")
         escreva("LOGIN: ")
         leia(login)
         escreva("SENHA: ")
         leia(password)
         
         //Caso erre o login e senha, o usu�rio cair� nessa estrutura de repeti��o
         tentativas <- 3
         enquanto (login <> "admin") ou (password <> "admin") faca

            escreval("LOGIN OU SENHA INV�LIDO, POR FAVOR, TENTE NOVAMENTE")
            escreval("VOC� AINDA TEM: ", tentativas - 1, " TENTATIVAS")

            escreva("DIGITE SEU LOGIN: ")
            leia(login)
            escreva("DIGITE SUA SENHA: ")
            leia(password)
            
            tentativas <- tentativas - 1
            
            se tentativas = 0 entao
               escreva("LIMITE, FIM DO ATENDIMENTO.")
               Fimalgoritmo
            fimse
         fimenquanto
         
         limpatela
         

         escreval("DIGITE '1' PARA REALIZAR UM DEP�SITO.")
         escreval("DIGITE '2' PARA REALIZAR UM SAQUE.")
         escreval("DIGITE '3' PARA REALZIAR UM EMPR�STIMO.")
         escreval("DIGITE '4' PARA VERIFICAR O SALDO DA SUA CONTA")
         escreva("QUAL OPERA��O VOCE DESEJA FAZER: ")
         leia(operacao)
         // Por condi��o no variavel opera��o caso ela receba o valor de '0'
         // � necess�rio por um limite de tentativas para erros excessivos?
         //(Igual como consta no Login e senha?)

         enquanto (operacao <= 0) ou (operacao > 4) faca
            limpatela
            escreval("DIGITO INV�LIDO, POR FAVOR, DIGITE UM N�MERO V�LIDO A SEGUIR.")
            escreval("DIGITE '1' PARA REALIZAR UM DEP�SITO.")
            escreval("DIGITE '2' PARA REALIZAR UM SAQUE.")
            escreval("DIGITE '3' PARA REALIZAR UM EMPR�STIMO.")
            escreval("DIGITE '4' PARA VERIFICAR O SALDO DA SUA CONTA")
            leia(operacao)
         fimenquanto

         escolha operacao
         // Aqui pra quem n�o entendeu, eu declaro cada vari�vel com um valor atribuido,
         // com objetivo de me adequar para outras linguagens futuramente.
         deposito <- 0
         saldo <- 0
         saque <- 0
         emprestimo <- 0
         juros <- 0
         vTotal <- 0
         parcelas <- 0
         vTotal <- 0
         vTotalParcelado <- 0
         
          // Na estrutura escolha/caso estou identificando se h� valores n�o coerentes com o
          // programa, se virem algo, me alertem, ou fa�am altera��es conforme o entendimento de
          // de voc�s.
         caso 1
         
            escreva("QUAL SER� A CONTIA DO SEU DEP�SITO ? R$ ")
            leia(deposito)

            enquanto deposito < 50 fa�a
               escreval("VALOR INV�LIDO")
               escreval("VALOR M�NIMO PARA DEP�SITO PERMITIDO � DE R$ 50.")
               escreva("QUAL SER� � CONTIA A SER DEPOSITADA? R$")
            fimenquanto
            saldo <- saldo + deposito
            escreval("SEU SALDO ATUALIZADO �: R$ ", saldo:4:2)
         caso 2

            escreva("QUAL SER� � CONTIA SER SACADA? R$")
            leia(saque)
            
            enquanto saque < 10 faca
               escreval("VALOR INV�LIDO!")
               escreval("VALOR M�NIMO DE SAQUE PERMITIDO � DE R$ 10.")
               escreva("QUAL SER� � CONTIA A SER SACADA? R$")
               leia(saque)
            fimenquanto

            se saque > saldo entao
               escreval("SEU SALDO ATUAL �: R$", saldo:4:2)
               escreval("SEU SALDO � INSUFICI�NTE!")
               escreval("SE DESEJAR FAZER UM EMPR�STIMO, REFA�A A OPERA��O A SEGUIR.")
            senao
               saldo <- saldo - saque
            fimse
            escreval("SEU SALDO ATUALIZADO �: R$", saldo:4:2)

         caso 3

            escreva("QUAL VALOR DE EMPR�STIMO VOC� DESEJA? R$")
            leia(emprestimo)

            enquanto emprestimo < 500 faca
               escreval("VALOR DE IMPRESTIMO INSUFICI�NTE!")
               escreval("VALOR M�NIMO PARA EMPRESTIMO � DE: R$ 500")
               escreva("QUAL VALOR DE EMPR�STIMO VOC� DESEJA? R$")
               leia(emprestimo)
            fimenquanto
            saldo <- saldo + emprestimo
            // Quantas vezes a pessoa pode parcelar o emprestimo, quanto de juros vai cair
            // encima do valor final????

            se emprestimo < 1000 entao
               juros <- (emprestimo * 5) / 100
            senao
               se emprestimo < 3000 entao
                  juros <- (emprestimo * 10) / 100
               senao
                  se emprestimo < 5000 entao
                     juros <- (emprestimo * 15) / 100

                  senao
                     juros <- (emprestimo * 20) / 100
                  fimse
               fimse
            fimse

            escreval("EM QUANTAS PARCELAS VOC� DESEJA DIVIDIR O VALOR? ")
            leia(parcelas)

            enquanto parcelas <= 0 faca
               escreval("VALOR DE PARCELAS INV�LIDO")
               escreval("VALOR M�NIMO DE PARCELAS �: 1")
               escreval("EM QUANTAS PARCELAS VOC� DESEJA DIVIDIR O VALOR? ")
               leia(parcelas)
            fimenquanto

            vTotal <- emprestimo + juros
            vTotalParcelado <- (emprestimo + juros) / parcelas
            limpatela

            escreval("SEU EMPR�STIMO DE R$", emprestimo:4:2, " VAI FICAR NO VALOR DE R$", vTotal:4:2)
            escreval(" PARCELADO EM ", parcelas, "x DE: R$ ", vTotalParcelado:4:2)
            
         caso 4
              escreval("SEU SADO ATUAL �: R$", saldo:4:2)
         fimescolha
         escreval
         // controle do looping para o usu�rio fazer quantas opera��o desejar.
         escreval("SE VOC� DESEJA FAZER OUTRA OPERA��O DIGITE '1'")
         escreval("SE VOC� DESEJA ENCERRAR A OPERA��O DIGITE '2'")
         escreva("OP��O: ")
         leia(init)
         limpatela
         
      fimenquanto
      // Quem estiver visualizando, fique a vontade para fazer altera��es do jeito que desejar.
      // #Jesus_Te_Ama_Eu_Nao
Fimalgoritmo