require "instagram"

Instagram.configure do |config|

  config.client_id = ENV['IG_APP_ID']

  config.access_token = ENV['IG_APP_SECRET']

end