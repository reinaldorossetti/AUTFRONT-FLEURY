Dir[File.join(File.dirname(__FILE__), '../pages/*_page.rb')].each { |file| require file }

module CapybaraExtension
  def jquery(event)
    base.jquery(event)
  end
  def highlight(color="yellow")
    base.highlight(color)
  end
end

module CapybaraSeleniumExtension
  def jquery(evento)
    config_jquery
    driver.execute_script("$(arguments[0]).trigger(\"#{evento}\")", native)
  end
  def highlight(color)
    config_jquery
    driver.execute_script("$(arguments[0]).css({'border':'5px solid #{color}'});", native)
  end
  def config_jquery
    dir_atual = File.expand_path File.dirname(__FILE__) # pega o caminho do arquivo
    js = File.read("#{dir_atual}/jquery-3.5.1.min.js") # ler o arquivo jquery
    driver.execute_script(js)
  end
end

# importando minha funcao para dentro do framework
::Capybara::Selenium::Node.send :include, CapybaraSeleniumExtension
::Capybara::Node::Element.send :include, CapybaraExtension

module PageObjects

    def agendar_covid
      @usr_agencar_covid ||= CriaAgendamento.new
    end

    # Function to click and  verified if element is visible.
    # @param [web element] element
    # @param [Boolean] highlight
    # @return [void] no return.
    def clique(element, highlight=false)
  
      # Mapeia o elemento e verifica se o elemento existe e visivel.
      scroll_to(element)
      element.highlight if highlight
      element_exists? element
      element.click
  
    rescue => ex
      log ex.message
      log ex.backtrace
      print "Tentando via javascript"
    end

    # Function to verified if element is visible.
    # @param [web element] element
    # @param [Boolean] inpect
    # @return [Boolean] return is true or false.
    def element_exists?(element, inpect=false)

      if element.visible?
          log element.inspect if inpect # only true
          true
      end
  
    rescue => ex
      log ex.message
      log ex.backtrace
      print "Tela #{page.title} - Elemento '#{element.inspect}' não encontrado."
      false
  
    end

  # Function to take screenshot and to embed in the html report
  # @param [String] file_name
  # @param [String] test_result
  # @return [void] return void or error message.
  def take_screenshot(file_name:, test_result:)
    path = File.expand_path('../../', File.dirname(__FILE__))
    file_path = path + "/results/screenshots/test_#{test_result}"
    screenshot = "#{file_path}/#{file_name}.png"
    page.save_screenshot(screenshot)
    attach(screenshot, 'image/png')
  rescue => ex
    p ex
  end

end
  
  
  


