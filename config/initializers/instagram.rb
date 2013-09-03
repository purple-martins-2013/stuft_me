require 'instagram'

Instagram.configure do |config|
  config.client_id = ENV["client_id"]
  config.access_token = ENV["access_token"]
end
