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
    
  end
end
