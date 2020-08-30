Before do

    @core        = Core.new
    @login       = Login.new
    @add         = AddProducts.new
    @weather_api = GetWeather.new

    @params      = []
end
  
After do |scn|
    if scn.failed? && ENV['debug']
        binding.pry
    end

    if scn.tags.map(&:name).include?('web')
        Capybara.current_session.driver.browser.manage.delete_all_cookies
    end

    if scn.failed?
        screenshot = save_screenshot("./results/#{rand(100000..999999)}.png")
        embed(screenshot, 'image/png')
        File.delete(screenshot) if File.exist?(screenshot)
    end  
end

at_exit do
    ReportBuilder.configure do |config|
        config.input_path = 'results/cucumber_json.json'
        config.report_path = 'results/my_test_report'
        config.report_types = [:retry, :html]
        config.report_title = 'Testes Zé Delivery'
      end
      
      ReportBuilder.build_report
end
  



