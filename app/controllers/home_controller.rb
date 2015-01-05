class HomeController < ApplicationController
  def index
    Ipsum.fill_dictionary
    @tagline = $markov.generate_2_sentences
    @song = Song.new()
  end

  def generate_ipsum
    render json: { text: $markov.generate_4_sentences }
  end
end
