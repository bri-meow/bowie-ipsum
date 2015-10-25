require_relative '../../twitter-bot/bot'
desc "Runs the twitter-bot"
task :tweet => :environment do
    puts "TWEEEEEETING"
    tweet
    puts "did it!"
end

