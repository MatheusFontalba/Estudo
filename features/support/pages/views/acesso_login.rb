class AcessoLogin
  include Capybara::DSL
    def acesso
        visit "http://automationpractice.com/index.php"
    end
    
    def login
        find(".login").click
    end

end