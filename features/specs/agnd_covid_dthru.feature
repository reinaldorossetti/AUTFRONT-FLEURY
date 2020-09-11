#language: pt
#utf-8

@automation
Funcionalidade: Agendamento de Exame COVID
Como cliente do Laboratório Grupo Fleury
Quero ter a opção de realizar e acompanhar meu Agendamento do Exame COVID.

Contexto:
Dado a pagina de Agendamento

@Agendamento
Esquema do Cenário: Agendar via Drive-Thru Particular com CPF/nascimento inválido
Quando fornecer "<cpf>" ou "<nascimento>" inválido
Então o sistema apresenta "<msg_alerta>"

Exemplos:
|     cpf     |    nascimento   |               msg_alerta                      |
| 51620932032 |    16/12/60     |  Data inválida! Por favor, preencha novamente |
| 00000000000 |    2708/1976    |  Preencha o CPF correto, por favor. Em caso de paciente menor de idade sem CPF, inclua o da pessoa responsável |



