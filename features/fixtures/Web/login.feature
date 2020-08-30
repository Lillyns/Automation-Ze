#language: pt
@login @web
Funcionalidade: Login com usuário já cadastrado
    Realizar autenticação

    Cenario: Login com sucesso
        Dado que estou na "url" da aplicação
            E confirmo que tenho mais de 18 anos
        Quando insiro os dados válidos de login
        Entao é redirecionado para a home com o texto "Olá, Liliane"
