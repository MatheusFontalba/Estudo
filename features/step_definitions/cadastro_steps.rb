Quando('eu clicar em Create an Account') do
  @Cadastro.entrar.acesso # Acessar o site
  @Cadastro.entrar.login  # Acessar a pagina para logar
  @Cadastro.entrar.iniciar # Acessa o botão Create an Account
end
  
Então('devo preencher o formulário com os {string}') do |dados|
  @massa = YAML.load_file(File.join(Dir.pwd, 'features/support/fixtures/cadastro_fixtures.yaml'))
  @cadastro_sucesso = @massa[dados]
  @Cadastro.genero
  @Cadastro.nome(@cadastro_sucesso['primeiroNome'])
  @Cadastro.sobrenome(@cadastro_sucesso['ultimoNome'])
  @Cadastro.senha(@cadastro_sucesso['password'])
  @Cadastro.dia(@cadastro_sucesso['nascimento']['dia'])
  @Cadastro.mes(@cadastro_sucesso['nascimento']['mes'])
  @Cadastro.ano(@cadastro_sucesso['nascimento']['ano'])
  @Cadastro.news
  @Cadastro.nomeprop(@cadastro_sucesso['local']['nomeCadastro'])
  @Cadastro.sobrenomeprop(@cadastro_sucesso['local']['sobrenomeCadastro'])
  @Cadastro.dadoslocal(@cadastro_sucesso['local']['endereço'])
  @Cadastro.cidade(@cadastro_sucesso['local']['cidade'])
  @Cadastro.estado(@cadastro_sucesso['local']['estado'])
  @Cadastro.cep(@cadastro_sucesso['local']['cep'])
  @Cadastro.telefone(@cadastro_sucesso['local']['telefone'])
end
  
Então('devo ter um usuário criado na plataforma') do
  @Cadastro.criar
    expect(find('.info-account')).to have_text 'Welcome to your account. Here you can manage all of your personal information and orders.'
end

# Cenario falho

Quando('clicar em Create an Account') do
  @Cadastro.entrar.acesso
  @Cadastro.entrar.login
  @Cadastro.entrar.iniciar
end
  
Então('irei preencher o formulário com os {string}') do |dados|
  @massa = YAML.load_file(File.join(Dir.pwd, 'features/support/fixtures/cadastro_fixtures.yaml'))
  @cadastro_errado = @massa[dados]
  @Cadastro.genero
  @Cadastro.nome(@cadastro_errado['primeiroNome'])
  @Cadastro.sobrenome(@cadastro_errado['ultimoNome'])
  @Cadastro.senha(@cadastro_errado['password'])
  @Cadastro.dia(@cadastro_errado['nascimento']['dia'])
  @Cadastro.mes(@cadastro_errado['nascimento']['mes'])
  @Cadastro.ano(@cadastro_errado['nascimento']['ano'])
  @Cadastro.news
  @Cadastro.nomeprop(@cadastro_errado['local']['nomeCadastro'])
  @Cadastro.sobrenomeprop(@cadastro_errado['local']['sobrenomeCadastro'])
  @Cadastro.dadoslocal(@cadastro_errado['local']['endereço'])
  @Cadastro.cidade(@cadastro_errado['local']['cidade'])
  @Cadastro.estado(@cadastro_errado['local']['estado'])
  @Cadastro.cep(@cadastro_errado['local']['cep'])
  @Cadastro.telefone(@cadastro_errado['local']['telefone'])
end
  
Então('não devo ter um usuário criado na plataforma') do
  @Cadastro.criar
    expect(page).to have_text @cadastro_errado['alerta']
end