class SongsController < ApplicationController
  def create
    @song = Song.new(params.require(:song).permit(:title))
    if @song.save
      redirect_to root_path, notice: "Added #{@song.title} to BowieIpsum dictionary!"
    else
      redirect_to root_path, notice: "There was a problem"
    end
  end
end
