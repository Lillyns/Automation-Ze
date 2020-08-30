require 'selenium-webdriver'
require 'capybara/cucumber'
class Chrome

    def chrome_insecure
        args = %w(
            --incognito
        )
        caps = Selenium::WebDriver::Remote::Capabilities.chrome(
            "chromeOptions" => { 
             "args" => args, 
              w3c: false,
            },
            acceptInsecureCerts: true
        )
            Capybara.register_driver :chrome do |app|
                Capybara::Selenium::Driver.new(
                    app,
                    browser: :chrome,
                    desired_capabilities: caps
                )
        end
        :chrome
    end

    def chrome_insecure_headless
       args = %w(
           --headless
           --incognito
       )
       caps = Selenium::WebDriver::Remote::Capabilities.chrome(
        "chromeOptions" => {
          "args" => args,
          w3c: false,
        },
        acceptInsecureCerts: true
      )
           Capybara.register_driver :chrome_headless do |app|
               Capybara::Selenium::Driver.new(
                   app,
                   browser: :chrome,
                   desired_capabilities: caps
               )
       end
       :chrome_headless
   end
end