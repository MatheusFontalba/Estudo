#language: pt

Funcionalidade: Login

Para que eu possa realizar o acesso e fazer compras de roupas
Sendo um usuário cadastrado
Posso acessar o site com o meu email e senha

@logar
Cenário: Logar com um Usuário
   Quando eu clicar em Sign in
   E devo inserir o "Logar_Usuario"
   Então devo ser autenticado vendo a "mensagem" 

@logarerrado
Esquema do Cenário: Login Incorreto
   Quando eu clicar em Sign in
   E fazer o login com "<usuario>"
   Então não devo ser autenticado
   E deve apresentar um alerta
   
   Exemplos:
   |usuario|
   |Usuario_Senha_Errada|
   |Usuario_Email_Errado|
   |Usuario_Sem_Email   |
   |Usuario_Sem_Senha   |
