class HomeController < ApplicationController
  def index
    @songs = Song.all_alphabetized
    if @songs.length > 0
      Ipsum.fill_dictionary if !$markov
      @tagline = $markov.generate_2_sentences
    end
    @song = Song.new()
  end

  def generate_ipsum
    render json: { text: $markov.generate_4_sentences }
  end
end
