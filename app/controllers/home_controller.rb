class HomeController < ApplicationController
  def index
    fetcher = Lyricfy::Fetcher.new
    song = fetcher.search("David Bowie", "Starman")
    markov = MarkyMarkov::TemporaryDictionary.new
    song.lines.each do |line|
      markov.parse_string(line)
    end
    @tagline = markov.generate_2_sentences
  end

  def generate_ipsum
    # fill the dictionary
    markov = MarkyMarkov::TemporaryDictionary.new
    @songs = Song.all
    @songs.each do |song|
      fetcher = Lyricfy::Fetcher.new
      lyrics = fetcher.search("David Bowie", song.title)
      lyrics.lines.each do |line|
        markov.parse_string(line)
      end
    end
    #return some ipsum
    @ipsum = markov.generate_4_sentences
    #go back to the index
    render :index
  end
end
