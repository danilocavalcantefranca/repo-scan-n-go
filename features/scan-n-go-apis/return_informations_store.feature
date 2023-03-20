#language:pt

@consultar_api_lojas
Funcionalidade: Consultar endpoint lojas

@smoke @regressao @retornar_lojas
Cenário: Validar endpoint que retornam todas as lojas habilitadas
  Dado que estou com o token de autenticação
  Quando realizar a consulta no endpoint de lojas passando o parametro como "true"
  Então devo ter retornado todas as lojas habilitadas