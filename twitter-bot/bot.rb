require 'twitter'
require 'dotenv-rails'


def tweet
    puts ENV['TWITTER_CONSUMER_KEY']
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
      config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
      config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
      config.access_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']
    end
    
    Ipsum.fill_dictionary
    bowie_ipsum = $markov.generate_2_sentences    
    client.update(bowie_ipsum)
end
