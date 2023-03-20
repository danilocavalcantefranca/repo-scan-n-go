Dado('que estou com o token de autenticação') do
  json_autentication = @service.call(ReturnTokenAutentication).return_json_for_autentication
  @response_api_autentication = @service.call(ReturnTokenAutentication).return_token_autentication(json_autentication)
  expect(@response_api_autentication.code).to eql(STATUS_CODE['sucess']['status_created'])
end

Quando('realizar a consulta no endpoint de lojas passando o parametro como {string}') do |param|
  @info_stores = @service.call(ReturnStoreService).return_stores(@response_api_autentication['data']['token'], param)
  expect(@info_stores.code).to eql(STATUS_CODE['sucess']['status_ok'])
end

Então('devo ter retornado todas as lojas habilitadas') do
  @info_stores.size.times{|count|
    expect(@info_stores[count]['storeCode']).not_to be_nil
    expect(@info_stores[count]['name']).not_to be_nil
  }
end