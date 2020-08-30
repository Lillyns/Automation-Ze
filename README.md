# Critical flows

### Login
Necessário para indentificação e segurança do cliente, pois sem o mesmo, qualquer pessoa poderia ter acesso aos dados sigiloosos (como os dados pessoais)

### Carrinho
É importante para definição dos valores a serem pagos, o mesmo precisa que esteja funcionando de acordo, tanto a parte de edição de quantidades de produtos quanto o cálculo do que será pago. Pois sem isso, poderá ocorrer prejuízos para ambas as partes, levando assim também, à possíveis processos referentes a pagamentos indevidos.

### Pagamento
Sem isso, o recebimento do valor não poderá ser efetuado, e juntamente com o login, o valor será cobrado da pessoa indentificada na sessão.

___
# Manual de execução (Execução no Linux)

### Pré-Requisitos
1 - Ruby instalado
  - https://rvm.io/
  - no link é possivel baixar uma versão estável do Ruby

2 - Bundler instalado, digite:
   - gem install bundler
   
3 - Instalar os pacotes do projeto, digite:
   - bundle install
   
4 - Browser Chrome versão 80
   - Obs: Adicionei ao repositório uma versão fixa do Chrome, caso vocês não tenham essa versão (Normalmente o pacote do navegador não ficaria no repositorio, adicionei apenas para facilitar a instalação e execução dos testes).

5 - Instalar Chromedriver versão 80
   - https://chromedriver.storage.googleapis.com/index.html?path=80.0.3987.106/
   - Após baixar o chromedriver, descompacte o arquivo e mova-o para dentro da pasta "/usr/local/bin"


### Execução (pelo terminal)
1 -Para execução de todos os cenários, digite:
   - cucumber
   
2 - Para execução dos cenários web, digite:
   - cucumber -t @web
   
3 - Para execução dos cenários API, digite:
   - cucumber -t @api
   
4 - Para visualização do report, abra o arquivo html, dentro da pasta results
   - my_test_report.html