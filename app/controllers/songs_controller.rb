class SongsController < ApplicationController
  def create
    @song = Song.new(params.require(:song).permit(:title))
    if @song.save
      Ipsum.add_song(@song)
      redirect_to root_path, notice: "Added #{@song.title} to BowieIpsum dictionary!"
    else
      redirect_to root_path, notice: @song.errors.full_messages.first
    end
  end

  def index
    songs = Song.all
    @songs_first = songs[0...songs.length/2]
    @songs_last = songs[songs.length/2..-1]
  end
end
