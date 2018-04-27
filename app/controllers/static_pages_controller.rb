class StaticPagesController < ApplicationController
  def home
    @bookmark = Bookmark.new
  end
end
