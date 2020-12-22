# Login sem erros
Quando('eu clicar em Sign in') do 
    @Login.signin.acesso
    @Login.signin.login
  end
  
  Então('devo inserir o {string}') do |usuario|
    @file = YAML.load_file(File.join(Dir.pwd, "features/support/fixtures/usuario_fixtures.yaml"))
    @login_sucesso = @file[usuario]
    @Login.autenticar(@login_sucesso["email"], @login_sucesso["senha"])
  end
  
  Então('devo ser autenticado vendo a {string}') do |mensagem|
    expect(find('.info-account')).to have_text @login_sucesso[mensagem]
  end

  # Login com erros

  Quando('fazer o login com {string}') do |usuario|
    @file = YAML.load_file(File.join(Dir.pwd, "features/support/fixtures/usuario_fixtures.yaml"))
    @login_erro = @file[usuario]
    @Login.autenticar(@login_erro["email"], @login_erro["senha"])
    
  end
  
  Então('não devo ser autenticado') do
    expect(page.current_url).to have_text "index.php?controller=authentication"

  end
  
  Então('deve apresentar um alerta') do
    # expect(find(".alert-danger li")).to have_text @login_erro["alerta"]
    expect(page).to have_text @login_erro["alerta"]
  end
