class AddProducts
    attr_reader(*EL.keys.map(&:to_sym))

    def initialize
        @core = Core.new
        EL.map { |key, _value| instance_variable_set("@#{key}", EL[key]) }
    end

    def select_products
        @core.assert_slt(select_produt)
        @core.click_field(select_produt)
    end

    def verify_amount(amount)
        qtd = @core.get_text(amount_products)
        @core.verify_txt(qtd, amount)
    end

    def convert_to_money(elm)
        value = @core.get_text(elm)
        Monetize.parse(value).to_f
    end

    def verify_new_value
        new_value = convert_to_money(total_price)
        @core.verify_txt(@value, new_value)  
        @core.click_field(add_buttom)
    end

    def edit_products
        @value = convert_to_money(total_price)
        @core.click_field(plus_button)
        verify_amount('02')
        @value = @value * 2
        verify_new_value
    end

    def verify_bag
        subtotal = convert_to_money(bag_total_price)
        @core.verify_txt(@value, subtotal)
        shipping = convert_to_money(bag_shipping)
        total = (subtotal + shipping).round(2)
        total_pay = convert_to_money(bag_total_pay)
        @core.verify_txt(total, total_pay) 
    end
    
    def clear_cart
        @core.find_text('Adicionar mais produtos')
        @core.click_field(bag_clear)
        @core.find_text('Você deseja remover este produto?')
        @core.click_field(bag_confirm)
        @core.find_text('Putz, está vazia!')
    end
end