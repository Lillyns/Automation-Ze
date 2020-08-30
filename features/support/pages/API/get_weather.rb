class GetWeather
    include HTTParty
    include RSpec::Matchers

    base_uri DATA['base_uri']

    def insert_params(new_param, params)
        params << new_param.join('=')
        [params.join('&')]
    end

    def submit_request(method:, route:, body: nil, params:)
        @header = {
            'Content-Type': 'application/json'
        }
        route = [route, params].join("?")

        self.class.send(method, route, headers: @header, timeout: 60)
    end

    def validate_response(response)
        city = response['name']
        temperature = response['main']['temp']
        expect(response.code).to eql 200
        expect(city).to eql "São Paulo"
        expect(temperature).to be_kind_of Numeric
        puts "A temperatura atual da cidade #{city} é de #{temperature} graus celsius"
    end

    def check_schema(response, schema)
        schema = File.read(Dir.pwd + "/environments/schema/" + schema + '.json')
        schema = JSON.parse(schema)

        response_body = JSON.parse(response.body)
        validations   = JSON::Validator.fully_validate(schema, response_body, strict: true)

        raise(validations.join("\n")) unless validations.empty?
    end
end