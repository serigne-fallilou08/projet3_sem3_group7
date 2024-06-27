require 'twitter'

# Clés d'API Twitter
client = Twitter::Streaming::Client.new do |config|
  config.consumer_key        = 'OY3RixWdwtO1PXkrHrazDISPr'
  config.consumer_secret     = 'znFywnZtDihXxqO5U6wxBmBcHKifozqfxUlMugvmpsFCeeG5Sa'
  config.access_token        = '790293889949298688-L34gs4qQIWAVQ8ojbnPSCkMIYkZQZIW'
  config.access_token_secret = 'niUmgGbi1bM7Cnb1fdN0HdU4Qbn4t26xE5LIwZpn42P2c'
end

# Écoute les tweets en temps réel avec le hashtag #hello_world
client.filter(track: '#hello_world') do |tweet|
  begin
    # Like le tweet
    client.favorite(tweet)
    puts "Tweet liké : #{tweet.text}"

    # Suit l'utilisateur
    client.follow(tweet.user)
    puts "Utilisateur suivi : #{tweet.user.screen_name}"
  rescue Twitter::Error => e
    puts "Erreur lors du traitement du tweet : #{e.message}"
  end
end
