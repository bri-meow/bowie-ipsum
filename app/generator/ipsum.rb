class Ipsum
  def self.fill_dictionary
    $markov = MarkyMarkov::TemporaryDictionary.new(1)
    fetcher = Lyricfy::Fetcher.new
    @songs = Song.all
    @songs.each do |song|
      add_lyrics(song.title, fetcher)
    end
  end

  def self.add_song(song)
    fetcher = Lyricfy::Fetcher.new
    add_lyrics(song.title, fetcher)
  end

private

  def self.add_lyrics(song_title, fetcher)
    lyrics = fetcher.search("David Bowie", song_title)
    lyrics.lines.each do |line|
      $markov.parse_string(line)
    end
  end

end
