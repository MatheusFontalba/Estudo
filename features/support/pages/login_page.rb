class Login
  include Capybara::DSL
  
  def signin
    AcessoLogin.new
  end
  
  def autenticar(email, senha)
    find('#email').set email
    find("input[name=passwd]").set senha
    click_button "Sign in"
  end
end
