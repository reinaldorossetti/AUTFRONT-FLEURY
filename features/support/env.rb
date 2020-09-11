require 'rspec'
require 'capybara'
require 'cucumber'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'capybara/rspec'
require 'bundler'
require 'site_prism'
require 'pry'
require 'yaml'
require 'rspec/retry'
require_relative 'helper.rb'

#DADOS = YAML.load(File.open(File.join(File.dirname(__FILE__) + "/massa/tb.yml")))

World(PageObjects)

# Configurando o driver Capybara.
Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :firefox)
end

# configurando o native_events como true.
Capybara.register_driver :selenium do |app|
  profile = Selenium::WebDriver::Firefox::Profile.new
  profile.native_events = true
  Capybara::Selenium::Driver.new(app, :browser => :firefox, profile: profile)
end
# ago

# Setando a configuração do Driver como padrão.
Capybara.default_driver = :selenium

# timeout padrão na execução.
Capybara.default_max_wait_time = 15

# Maximizar a tela ao iniciar o teste.
Capybara.page.driver.browser.manage.window.maximize

# tratamento de erro Net Timeout.
RSpec.configure do |config|
  config.verbose_retry = true
  config.default_retry_count = 3
  config.exceptions_to_retry = [Net::ReadTimeout]
end