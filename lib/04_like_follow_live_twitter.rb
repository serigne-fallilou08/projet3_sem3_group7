require 'twitter'

# Remplacez ces valeurs par vos propres clés d'API Twitter
client = Twitter::Streaming::Client.new do |config|
  config.consumer_key        = 'YOUR_CONSUMER_KEY'
  config.consumer_secret     = 'YOUR_CONSUMER_SECRET'
  config.access_token        = 'YOUR_ACCESS_TOKEN'
  config.access_token_secret = 'YOUR_ACCESS_TOKEN_SECRET'
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
