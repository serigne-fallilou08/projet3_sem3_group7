require 'twitter'

# Remplacez ces valeurs par vos propres clés d'API Twitter
client = Twitter::REST::Client.new do |config|
  config.consumer_key        = 'YOUR_CONSUMER_KEY'
  config.consumer_secret     = 'YOUR_CONSUMER_SECRET'
  config.access_token        = 'YOUR_ACCESS_TOKEN'
  config.access_token_secret = 'YOUR_ACCESS_TOKEN_SECRET'
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
