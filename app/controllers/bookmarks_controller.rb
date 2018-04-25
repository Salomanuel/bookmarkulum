class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.all
    @bookmark  = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    if @bookmark.save 
      redirect_to @bookmark
    else
      render 'index'
    end
  end

  def show
    @bookmark = Bookmark.find(params[:id])
  end


  private

    def bookmark_params(params)
      params.require(:bookmark).permit(
        :title, :url, :shortening)
    end
end
