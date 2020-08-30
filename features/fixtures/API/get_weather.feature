#language: pt
@weather @api
Funcionalidade: Verificar temperatura atual
    Realizar uma consulta por cidade para verificar a temperatura
    

    Cenario: Verificar temperatura consultando pelo id de SP
        Dado um parametro 'units' recebendo o valor 'metric'
            E um parametro 'lang' recebendo o valor 'pt_br'
            E um parametro 'appid' recebendo o valor 'ff0385ed4f6f3d61a33d1c67711029f9'
            E um parametro 'id' recebendo o valor '3448439'
        Quando realizo um 'GET' no rota '/data/2.5/weather'
        Então espero receber um codigo de sucesso e a temperatura da cidade
            E eu comparo a resposta com o contrato "weatherSchema"