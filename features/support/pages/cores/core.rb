class Core
    include RSpec::Matchers
    include Capybara::DSL
  
    def set_field(elm, value)
      find(elm).set value
      rescue StandardError => e
        raise "Nao foi possivel encontrar o elemento #{elm}" if e.to_s.include?('expected to find')
    end
  
    def click_field(elm)
      find(elm).click
      rescue StandardError => e
        raise "Nao foi possivel encontrar o elemento #{elm}" if e.to_s.include?('expected to find')
    end

    def find_text(value)
      expect(assert_text(value))
      rescue StandardError => e
        raise "Nao foi possivel encontrar o texto #{value}" if e.to_s.include?('expected to find')
    end

    def verify_url(url)
      expect(current_url).to eql url
      rescue StandardError => e
        raise "Nao foi possivel encontrar o texto #{url}" if e.to_s.include?('expected to find')
    end

    def page_validation(txt:, url:)
      self.find_text(txt)
      self.verify_url(url)
    end

    def assert_slt(elm)
      assert_selector(elm)
      rescue StandardError => e
        raise "Nao foi possivel encontrar o elemento #{elm}" if e.to_s.include?('expected to find')
    end

    def assert_no_txt(txt)
      assert_no_text(txt)
      rescue StandardError => e
        raise "Foi possivel encontrar o texto #{txt}" if e.to_s.include?('expected to find')
    end

    def get_text(elm)
      find(elm).text
      rescue StandardError => e
        raise "Nao foi possivel encontrar o texto #{elm}" if e.to_s.include?('expected to find')
    end

    def verify_txt(elm, value)
      expect(elm).to eql value
      rescue StandardError => e
        raise "Nao foi possivel encontrar o texto #{url}" if e.to_s.include?('expected to find')
    end
end