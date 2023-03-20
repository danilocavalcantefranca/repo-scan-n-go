class ReturnTokenAutentication

  include HTTParty

  base_uri HOST_APPLICATION
  
  headers 'Content-Type' => 'application/json', 'user-agent' => 'AutomationRuby'

  def return_json_for_authentication
    json = File.read('features/templates/auth-scan-n-go/return_json_authentication.json')
    json_parsed = JSON.parse(json)
  end

  def return_token_authentication(path = PATHS['path']['scan-n-go-auth']['auth'], payload)
    self.class.post(path, :body => payload.to_json ,:headers => {'clientId' => CLIENT_ID, 'x-api-key' => X_API_KEY})
  end
  
end