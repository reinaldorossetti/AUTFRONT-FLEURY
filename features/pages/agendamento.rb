class CriaAgendamento < SitePrism::Page
    set_url 'http://drive-thru-hml.s3-website-us-west-2.amazonaws.com'

    #Formulário
    element :cpf, '#cpf'
    element :dt_nasc, '#birthDate'
    
    #Botões Internos
    element :btn_agendar_agora_drive, '.japxss-0.japxss-1.sc-1xwwlpg-6.hjOANf' 
    element :btn_particular, 'p[class="sc-1dhlr7e-11 bxeXpc"]', :text => 'Particular' 
    element :btn_continuar, '#ID_CPF_Nascimento'
    element :btn_sou_profissional_saude, 'span[class="checkSpan"]'  
    
    
    #Mensagens
    element :msg_cpf_inval,           'span[class="yflb8w-8 entRDA"]', :text => 'Preencha o CPF correto, por favor. Em caso de paciente menor de idade sem CPF, inclua o da pessoa responsável' 
    element :msg_dt_nasc_inval,       'span[class="yflb8w-8 entRDA"]' 
    element :msg_cpf_dtnasc_inval,    'span[class="yflb8w-8 entRDA"]' 

    
    expected_elements :cpf, :dt_nasc, :btn_agendar_agora_drive, :btn_continuar, :btn_particular
        
   
    end