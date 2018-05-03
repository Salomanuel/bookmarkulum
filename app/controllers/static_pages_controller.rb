class StaticPagesController < ApplicationController
  def home
    @bookmark = Bookmark.new
  end

  private
    # quite simple and stupid search,returns just one exact result
    # def find_bookmark(params)
    #   Bookmark.find_by(title: params[:bookmark_title])
    # end
end
