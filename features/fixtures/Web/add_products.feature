#language: pt
@add @web
Funcionalidade: Busca produto
    Realizar uma busca por produto
    
    Contexto: Estar logado na aplicação
        Dado que estou logado na aplicação

    Cenario: Adicionar produto em um carrinho vazia
        Dado que seleciono a categoria Vinhos
            E seleciono um produto
        Quando aumento em +1 a quantidade
        Entao ao adicionar o produto, é exibido o valor corretamente
