Dado('que estou na {string} da aplicação') do |url|
  url = DATA['url']
  visit (url)
end

Dado('confirmo que tenho mais de 18 anos') do
  @login.verify_age
end

Quando('insiro os dados válidos de login') do
  @login.login_with(usuario: DATA['email'], password: DATA['password'])
  @core.find_text('Aguarde um momento')
end

Entao('é redirecionado para a home com o texto {string}') do |txt|
  @core.assert_no_txt('Aguarde um momento')
  @core.page_validation(txt: txt, url:DATA['products_url'])
end