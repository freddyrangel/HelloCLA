require 'hello_sign'
HelloSign.configure do |config|
  config.api_key = ENV['HS_API_KEY']
end
