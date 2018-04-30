class StaticPagesController < ApplicationController
  def home
    @bookmark = Bookmark.new
  end

  def search
    if params[:bookmark_title]
      @bookmark = find_bookmark(params)
    end
  end

  private
    def find_bookmark(params)
      Bookmark.find_by(title: params[:bookmark_title])
    end
end
