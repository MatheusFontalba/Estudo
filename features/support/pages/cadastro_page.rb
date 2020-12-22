class Cadastro
    include Capybara::DSL

    def entrar
      AcessoCadastro.new
    end

    def genero
        Capybara.ignore_hidden_elements = false
        find('#id_gender1').click                                                                                # setar o sexo
        Capybara.ignore_hidden_elements = true
    end

    def nome(primeiroNome)
        find('#customer_firstname').set primeiroNome
    end

    def sobrenome(ultimoNome)
        find('#customer_lastname').set ultimoNome                                                                # setar ultimo nome
    end

    def senha(password)
        find('#passwd').set password                                                                             # inserir a senha
    end
    
    def dia(dia)
        Capybara.ignore_hidden_elements = false
        select(dia, from: 'days')
        Capybara.ignore_hidden_elements = true
    end
    
    def mes(mes)
        Capybara.ignore_hidden_elements = false
        select(mes, from: 'months')
        Capybara.ignore_hidden_elements = true
    end

    def ano(ano)
        Capybara.ignore_hidden_elements = false
        select(ano, from: 'years')
        Capybara.ignore_hidden_elements = true
    end

    def news
        find('#uniform-newsletter').set true# nao utilizei value pois as checkboxes possuem o mesmo valor
    end

    def nomeprop(nomeCadastro)
        find('#firstname').set nomeCadastro
    end

    def sobrenomeprop(sobrenomeCadastro)
        find('#lastname').set sobrenomeCadastro
    end
    
    def dadoslocal(endereco)
        find('#address1').set endereco
    end

    def cidade(cidade)
        find('#city').set cidade
    end

    def estado(estado)
        Capybara.ignore_hidden_elements = false
        select(estado, from: 'id_state')
        Capybara.ignore_hidden_elements = true
    end

    def cep(cep)
        find('#postcode').set cep
    end

    def telefone(telefone)
        find('#phone_mobile').set telefone
    end

    def criar
        click_button "Register"
        sleep 3
    end
end