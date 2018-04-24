class Bookmark < ApplicationRecord
  belongs_to :site

  validates_presence_of :title, :url, :shortening, :site
  
  # validates :title,       presence: true
  # validates :url,         presence: true
  # validates :shortening,  presence: true

end
