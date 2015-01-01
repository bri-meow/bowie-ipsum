class HomeController < ApplicationController
  def index
    fill_dictionary
    @tagline = $markov.generate_2_sentences
    @song = Song.new()
  end

  def generate_ipsum
    @song = Song.new()
    #return some ipsum
    @ipsum = $markov.generate_4_sentences
    respond_to do |format|
      format.js {}
    end
  end

  def fill_dictionary
    $markov = MarkyMarkov::TemporaryDictionary.new
    fetcher = Lyricfy::Fetcher.new
    @songs = Song.all
    @songs.each do |song|
      lyrics = fetcher.search("David Bowie", song.title)
      lyrics.lines.each do |line|
        $markov.parse_string(line)
      end
    end
  end
end
