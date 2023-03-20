require 'cucumber'
require 'rspec'
require 'httparty'


PATHS = YAML.load_file("config/paths.yml")
STATUS_CODE = YAML.load_file("config/status_code.yml")

HOST_APPLICATION = ENV['HOST_APPLICATION']
CLIENT_ID        = ENV['CLIENT_ID']
X_API_KEY        = ENV['X_API_KEY']


Before do
  @service = lambda {|klass| klass.new}
end