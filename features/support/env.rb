require 'pry'
require 'capybara/cucumber'
require 'httparty'
require 'json-schema'
require 'monetize'
require 'rspec'
require 'selenium-webdriver'
require 'report_builder'
require_relative './webdrivers/chrome.rb'

@browser = ENV['BROWSER']
Capybara.configure do |config|
   case @browser
   when "chrome"
        @driver = Chrome.new.chrome_insecure
   when "chrome_headless"
       @driver = Chrome.new.chrome_insecure_headless
   end
   config.default_driver = @driver
   config.default_max_wait_time = 15
   config.default_selector = :xpath

end

Money.default_currency= "BRL"
# Set default value in order to avoid major versions warning from monetize gem
Money.rounding_mode=7

EL     = YAML.load_file('./environments/elm.yml')
DATA   = YAML.load_file('./environments/data.yml')