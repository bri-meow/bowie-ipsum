class Ipsum
  def self.fill_dictionary
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
