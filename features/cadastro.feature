#language: pt

Funcionalidade: Cadastro

Para que eu possa realizar o acesso e fazer compras de roupas
Sendo um usuário que será cadastrado
Posso preencher os dados que serão cadastrados

@cadastrosucesso
Cenário: Criar Usuário
   Quando eu clicar em Create an Account
   Então devo preencher o formulário com os "Dados_Cadastrais"
   E devo ter um usuário criado na plataforma

@cadastroerrado
Esquema do Cenário: Preencher dados errados
   Quando clicar em Create an Account
   Então irei preencher o formulário com os "<dados>"
   E não devo ter um usuário criado na plataforma

   Exemplos:
   |dados|
   |Dados_Errados|
   |Dados_Nulos|
