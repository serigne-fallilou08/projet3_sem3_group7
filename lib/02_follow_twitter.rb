require 'twitter'

# Clés d'API Twitter
client = Twitter::REST::Client.new do |config|
  config.consumer_key        = 'OY3RixWdwtO1PXkrHrazDISPr'
  config.consumer_secret     = 'znFywnZtDihXxqO5U6wxBmBcHKifozqfxUlMugvmpsFCeeG5Sa'
  config.access_token        = '790293889949298688-L34gs4qQIWAVQ8ojbnPSCkMIYkZQZIW'
  config.access_token_secret = 'niUmgGbi1bM7Cnb1fdN0HdU4Qbn4t26xE5LIwZpn42P2c'
end

# Recherche des tweets avec le hashtag #hello_world
tweets = client.search("#hello_world", result_type: "recent").take(20)

# Suit chaque utilisateur qui a publié un tweet trouvé
tweets.each do |tweet|
  begin
    client.follow(tweet.user)
    puts "Utilisateur suivi : #{tweet.user.screen_name}"
  rescue Twitter::Error => e
    puts "Erreur lors du suivi de l'utilisateur : #{e.message}"
  end
end
