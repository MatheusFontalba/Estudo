class AcessoCadastro
    include Capybara::DSL

    def iniciar
        $randomemail = Faker::Internet.email
        find('#email_create').set $randomemail
        click_button "Create an account"
    end

    def acesso
        visit "http://automationpractice.com/index.php"
    end
    
    def login
        find(".login").click
    end
end