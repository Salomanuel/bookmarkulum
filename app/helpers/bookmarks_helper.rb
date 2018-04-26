module BookmarksHelper
      # returns true when the site is already in the database
  def site_exists?(host)
    not Site.find_by(top_level_url: host).nil?
  end
end
