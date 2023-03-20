Dado('que estou com o token de autenticação') do
  json_authentication = @service.call(ReturnTokenAutentication).return_json_for_authentication
  @response_api_autentication = @service.call(ReturnTokenAutentication).return_token_authentication(json_authentication)
  expect(@response_api_autentication.code).to eql(STATUS_CODE['success']['status_created'])
end

Quando('realizar a consulta no endpoint de lojas passando o parametro como {string}') do |param|
  @info_stores = @service.call(ReturnStoreService).return_stores(@response_api_autentication['data']['token'], param)
  expect(@info_stores.code).to eql(STATUS_CODE['success']['status_ok'])
end

Então('devo ter retornado todas as lojas habilitadas') do
  @info_stores.size.times{|count|
    expect(@info_stores[count]['storeCode']).not_to be_nil
    expect(@info_stores[count]['name']).not_to be_nil
  }
end