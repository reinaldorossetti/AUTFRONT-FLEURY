
Dado('que navego até a página de unidades') do
    screen_unidade.load
  end

Quando('o filtro por facilidades for selecionado') do
    clique screen_unidade.filtro_facilidade
    clique screen_unidade.bicicletario
    clique screen_unidade.vacinacao
    clique screen_unidade.atende_domingo
 end

Então('a unidade mais próxima é apresentada.') do
    screen_unidade.unidade_tela.highlight
    valida_unidade = (screen_unidade.unidade_tela.text)
    expect(valida_unidade).to eql('República do Líbano I')
    pp valida_unidade 
 end                      

