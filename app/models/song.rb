class Song < ActiveRecord::Base
  validate :has_lyrics
  validates_uniqueness_of :title

  def has_lyrics
    fetcher = Lyricfy::Fetcher.new
    begin
      fetcher.search("David Bowie", title)
      true
    rescue
      errors.add(:base, 'no lyrics available!')
    end
  end

  def self.all_alphabetized
    Song.all.order(:title)
  end
end
