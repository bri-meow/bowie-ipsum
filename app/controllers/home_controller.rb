class HomeController < ApplicationController
  def index
    if Song.all.length > 0
      Ipsum.fill_dictionary
      @tagline = $markov.generate_2_sentences
    end
    @song = Song.new()
  end

  def generate_ipsum
    render json: { text: $markov.generate_4_sentences }
  end
end
