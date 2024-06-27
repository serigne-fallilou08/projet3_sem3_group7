require 'twitter'

# Clés d'API Twitter
client = Twitter::REST::Client.new do |config|
  config.consumer_key        = 'OY3RixWdwtO1PXkrHrazDISPr'
  config.consumer_secret     = 'znFywnZtDihXxqO5U6wxBmBcHKifozqfxUlMugvmpsFCeeG5Sa'
  config.access_token        = '790293889949298688-L34gs4qQIWAVQ8ojbnPSCkMIYkZQZIW'
  config.access_token_secret = 'niUmgGbi1bM7Cnb1fdN0HdU4Qbn4t26xE5LIwZpn42P2c'
end

# Exemple : tweetez un message
client.update("Hello, Twitter! I'm a bot. #hello_world")

# Exemple : recherchez des tweets avec un hashtag spécifique
tweets = client.search("#ruby", result_type: "recent").take(10)
tweets.each do |tweet|
  puts "#{tweet.user.screen_name}: #{tweet.text}"
end
