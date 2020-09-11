Dado('a pagina de Agendamento') do
   agendar_covid.load
   agendar_covid.loaded?
   agendar_covid.btn_agendar_agora_drive.click
   agendar_covid.btn_particular.click 
end
  
Quando('fornecer {string} ou {string} inválido') do |ncpf, dtnasc|
    agendar_covid.cpf.set(ncpf).send_keys(:tab)
    agendar_covid.dt_nasc.set(dtnasc).send_keys(:tab)
end
  
Então('o sistema apresenta {string}') do |msg_alert|
    element_exists? agendar_covid.msg_cpf_dtnasc_inval
    agendar_covid.msg_cpf_dtnasc_inval.highlight
    pega_texto = agendar_covid.msg_cpf_dtnasc_inval.text
    expect(pega_texto).to eql(msg_alert)
end
  