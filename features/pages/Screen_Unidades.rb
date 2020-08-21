
class CriaScreenUnidades  < SitePrism::Page
    set_url 'https://www.fleury.com.br/unidades'

    #Tela
    element :filtro_facilidade, '#checkoox-select-facilities'
    element :bicicletario, 'label[for="_Bicicletário e vaga verde"]'
    element :vacinacao, 'label[for="_Vacinação"]'
    element :atende_domingo, 'label[for="_Atendimento aos domingos"]'
    element :unidade_proxima, '.typographycomponentstyle__H3-sc-1oox73n-3.caOpMn'
    element :unidade_tela, '.typographycomponentstyle__H1-sc-1oox73n-1.lomAMa'
    
    #Métodos


end     