class HomeController < ApplicationController
  def index
    Ipsum.fill_dictionary
    @tagline = $markov.generate_2_sentences
    @song = Song.new()
  end

  def generate_ipsum
    @song = Song.new()
    #return some ipsum
    @ipsum = "<span>"+ $markov.generate_4_sentences + " </span>"
    respond_to do |format|
      format.js {}
    end
  end
end
