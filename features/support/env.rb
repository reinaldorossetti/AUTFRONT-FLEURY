require 'rspec'
require 'capybara'
require 'cucumber'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'bundler'
require 'pry'
require 'yaml'
require 'site_prism'
require_relative 'helper.rb'

World(PageObjects)


# Configurando o driver Capybara.
Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

# Setando a configuração do Driver como padrão.
Capybara.default_driver = :selenium

# timeout padrão na execução.
Capybara.default_max_wait_time = 15

# Maximizar a tela ao iniciar o teste.
Capybara.page.driver.browser.manage.window.maximize