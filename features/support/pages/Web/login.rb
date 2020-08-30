class Login 
    attr_reader(*EL.keys.map(&:to_sym))

    def initialize
        @core = Core.new
        EL.map { |key, _value| instance_variable_set("@#{key}", EL[key]) }
    end

    def verify_age 
        @core.click_field(age_validation)
        @core.click_field(btn_enter)
    end

    def login_with(usuario:, password:)
        @core.set_field(email_field, usuario)
        @core.set_field(password_field, password)
        @core.click_field(sign_in)   
    end

end