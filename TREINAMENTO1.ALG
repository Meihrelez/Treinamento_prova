Algoritmo "treinamento1"
// A meta do treinamento 1 é fazer um programa que simule um caixa eletrônico
// tendo em vista o uso de estruturas: Sequêncial, se/entao/senao, enquanto, repita-ate e
//escolha/caso, tendo em vista que será de extrema ajuda você descrever a função de cada
// bloco de código com comentários para ajudar no entendimento dos mesmos.

Var
   login, password  : caractere
   init, tentativas, operacao, parcelas : inteiro
   deposito, saldo, saque, emprestimo, juros, vTotalParcelado, vTotal : real

Inicio

      escreval("Seja bem-vindo ao Banco Senai!")
      escreval("******************************")
      escreval("Para começar seu atendimento digite '1'")
      leia(init)
      
     //Usei a estrutura (repita-ate) para que o programa só termine assim que o usuário desejar
     // se for difente de '1'  o programa se encerra.

      enquanto init = 1 faca
         // login  e senha para acessar os serviços
         
         
         escrevaL("DIGITE SEU LONGIN E SENHA PARA ACESSAR SUA CONTA:")
         escreva("LOGIN: ")
         leia(login)
         escreva("SENHA: ")
         leia(password)
         
         //Caso erre o login e senha, o usuário cairá nessa estrutura de repetição
         tentativas <- 3
         enquanto (login <> "admin") ou (password <> "admin") faca

            escreval("LOGIN OU SENHA INVÁLIDO, POR FAVOR, TENTE NOVAMENTE")
            escreval("VOCÊ AINDA TEM: ", tentativas - 1, " TENTATIVAS")

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
         

         escreval("DIGITE '1' PARA REALIZAR UM DEPÓSITO.")
         escreval("DIGITE '2' PARA REALIZAR UM SAQUE.")
         escreval("DIGITE '3' PARA REALZIAR UM EMPRÉSTIMO.")
         escreval("DIGITE '4' PARA VERIFICAR O SALDO DA SUA CONTA")
         escreva("QUAL OPERAÇÃO VOCE DESEJA FAZER: ")
         leia(operacao)
         // Por condição no variavel operação caso ela receba o valor de '0'
         // é necessário por um limite de tentativas para erros excessivos?
         //(Igual como consta no Login e senha?)

         enquanto (operacao <= 0) ou (operacao > 4) faca
         
            limpatela
            escreval("DIGITO INVÁLIDO, POR FAVOR, DIGITE UM NÚMERO VÁLIDO A SEGUIR.")
            escreval("DIGITE '1' PARA REALIZAR UM DEPÓSITO.")
            escreval("DIGITE '2' PARA REALIZAR UM SAQUE.")
            escreval("DIGITE '3' PARA REALIZAR UM EMPRÉSTIMO.")
            escreval("DIGITE '4' PARA VERIFICAR O SALDO DA SUA CONTA")
            leia(operacao)

         fimenquanto
         
         

         escolha operacao
         // Aqui pra quem não entendeu, eu declaro cada variável com um valor atribuido,
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
         
          // Na estrutura escolha/caso estou identificando se há valores não coerentes com o
          // programa, se virem algo, me alertem, ou façam alterações conforme o entendimento de
          // de vocês.
         caso 1
         
            escreva("QUAL SERÁ A CONTIA DO SEU DEPÓSITO ? R$ ")
            leia(deposito)

            enquanto deposito < 50 faça
               escreval("VALOR INVÁLIDO")
               escreval("VALOR MÍNIMO PARA DEPÓSITO PERMITIDO É DE R$ 50.")
               escreva("QUAL SERÁ À CONTIA A SER DEPOSITADA? R$")
            fimenquanto
            saldo <- saldo + deposito
            escreval("SEU SALDO ATUALIZADO É: R$ ", saldo:4:2)
         caso 2

            escreva("QUAL SERÁ À CONTIA SER SACADA? R$")
            leia(saque)
            
            enquanto saque < 10 faca
               escreval("VALOR INVÁLIDO!")
               escreval("VALOR MÍNIMO DE SAQUE PERMITIDO É DE R$ 10.")
               escreva("QUAL SERÁ À CONTIA A SER SACADA? R$")
               leia(saque)
            fimenquanto

            se saque > saldo entao
               escreval("SEU SALDO ATUAL É: R$", saldo:4:2)
               escreval("SEU SALDO É INSUFICIÊNTE!")
               escreval("SE DESEJAR FAZER UM EMPRÉSTIMO, REFAÇA A OPERAÇÃO A SEGUIR.")
            senao
               saldo <- saldo - saque
            fimse
            escreval("SEU SALDO ATUALIZADO É: R$", saldo:4:2)

         caso 3

            escreva("QUAL VALOR DE EMPRÉSTIMO VOCÊ DESEJA? R$")
            leia(emprestimo)

            enquanto emprestimo < 500 faca
               escreval("VALOR DE IMPRESTIMO INSUFICIÊNTE!")
               escreval("VALOR MÍNIMO PARA EMPRESTIMO É DE: R$ 500")
               escreva("QUAL VALOR DE EMPRÉSTIMO VOCÊ DESEJA? R$")
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

            escreval("EM QUANTAS PARCELAS VOCÊ DESEJA DIVIDIR O VALOR? ")
            leia(parcelas)

            enquanto parcelas <= 0 faca
               escreval("VALOR DE PARCELAS INVÁLIDO")
               escreval("VALOR MÍNIMO DE PARCELAS É: 1")
               escreval("EM QUANTAS PARCELAS VOCÊ DESEJA DIVIDIR O VALOR? ")
               leia(parcelas)
            fimenquanto

            vTotal <- emprestimo + juros
            vTotalParcelado <- (emprestimo + juros) / parcelas
            limpatela

            escreval("SEU EMPRÉSTIMO DE R$", emprestimo:4:2, " VAI FICAR NO VALOR DE R$", vTotal:4:2)
            escreval(" PARCELADO EM ", parcelas, "x DE: R$ ", vTotalParcelado:4:2)
            
         caso 4
              escreval("SEU SADO ATUAL É: R$", saldo:4:2)
         fimescolha

         // controle do looping para o usuário fazer quantas operação desejar.
         escreval("VOCÊ DESEJA FAZER OUTRA OPERAÇÃO? SE SIM, DIGITE '1'")
         escreva("OPÇÃO: ")
         leia(init)
         limpatela
         
      fimenquanto
      // Quem estiver visualizando, fique a vontade para fazer alterações do jeito que desejar.
      // #Jesus_Te_Ama_Eu_Nao
Fimalgoritmo