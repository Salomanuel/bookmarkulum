class Bookmark < ApplicationRecord
  include BookmarksHelper
  # belongs_to :site

  validates_presence_of :title, :url, :shortening#, :site_id
  
  # validates :title,       presence: true
  # validates :url,         presence: true
  # validates :shortening,  presence: true

# site_exists?(host) is implemented in bookmarks_helper
  
  private
      # parses the URL and returns the host website
    def get_host_from(url)
      return URI.parse(url).host
    end
end
