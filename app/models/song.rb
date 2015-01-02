class Song < ActiveRecord::Base
  validate :has_lyrics

  def has_lyrics
    fetcher = Lyricfy::Fetcher.new
    begin
      fetcher.search("David Bowie", title)
      true
    rescue
      errors.add(:base, 'no lyrics!')
    end
  end
end
