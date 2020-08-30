Dado('um parametro {string} recebendo o valor {string}') do |chave, valor|
  @params = @weather_api.insert_params([chave,valor],@params)
end

Quando('realizo um {string} no rota {string}') do |method, route|
  @response = @weather_api.submit_request(method: method.downcase,route: route, params: @params)
end

Então('espero receber um codigo de sucesso e a temperatura da cidade') do
  @weather_api.validate_response(@response)
end

Então('eu comparo a resposta com o contrato {string}') do |schema|
  @weather_api.check_schema(@response, schema)
end