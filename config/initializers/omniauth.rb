Rails.application.config.middleware.use OmniAuth::Builder do
  provider :instagram, ENV['IG_APP_ID'] , ENV['IG_APP_SECRET']
  provider :twitter, ENV['TWITTER_ID'], ENV['TWITTER_SECRET']
end