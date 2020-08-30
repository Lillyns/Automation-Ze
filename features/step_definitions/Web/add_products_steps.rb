Dado("que estou logado na aplicação") do
    steps %(
        Dado que estou na "url" da aplicação
            E confirmo que tenho mais de 18 anos
        Quando insiro os dados válidos de login
        Entao é redirecionado para a home com o texto "Olá, Liliane"
    )
end

Dado('que seleciono a categoria Vinhos') do
  @core.click_field(EL['search_vinhos'])
end

Dado('seleciono um produto') do
  @add.select_products
end

Quando('aumento em +1 a quantidade') do 
   @add.edit_products
end

Entao('ao adicionar o produto, é exibido o valor corretamente') do
  @add.verify_bag
  @add.clear_cart
end