class ReturnStoreService

  include HTTParty

  base_uri HOST_APPLICATION
  
  headers 'Content-Type' => 'application/json', 'user-agent' => 'AutomationRuby'

  def return_stores(path = PATHS['path']['scan-n-go-store-ms']['stores'], token, bool)
    self.class.get(path + "?wl=#{bool}", :headers => {'x-api-key' => X_API_KEY, 'authorization' => "Bearer #{token}"})
  end
  
end
