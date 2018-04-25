class Bookmark < ApplicationRecord
  belongs_to :site

  validates_presence_of :title, :url, :shortening, :site_id
  
  # validates :title,       presence: true
  # validates :url,         presence: true
  # validates :shortening,  presence: true


  private
    # returns a shortened url from a long url
    def shortener(url)
      Bitly.client.shorten(url).short_url
    end

end
