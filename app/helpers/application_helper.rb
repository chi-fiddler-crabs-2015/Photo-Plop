module ApplicationHelper
  include TweetButton

  TweetButton.default_tweet_button_options = {:via => "photoplop"}
end
