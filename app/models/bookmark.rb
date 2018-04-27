class Bookmark < ApplicationRecord
  include BookmarksHelper
  before_validation :create_or_assign_site
  belongs_to :site

  validates_presence_of :title, :url, :shortening#, :site_id
  validates :url, :url => true


  
  private
      
    
    def create_or_assign_site
      host = get_host_from(self.url) # method from model/bookmark.rb

      if site_exists?(host)   # site_exists?(host) is implemented in bookmarks_helper.rb
        self.site = Site.find_by(top_level_url: host) # add site to bookmark
      else        
        new_site  = Site.create(top_level_url: host)  # creates the new site
        self.site = new_site                          # add site to bookmark
        
      end
    end

    # parses the URL and returns the host website
    def get_host_from(url)
      return URI.parse(url).host
    end
end