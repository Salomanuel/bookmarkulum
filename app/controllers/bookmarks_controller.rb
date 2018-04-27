class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.paginate(page: params[:page])
    @bookmark  = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    if @bookmark.save 
      redirect_to @bookmark
    else
      render inline: "<p><%= @bookmark.errors.messages %></p>"
    end
  end

  def show
    @bookmark = Bookmark.find(params[:id])
  end


  private

    def bookmark_params
      params.require(:bookmark).permit(
        :title, :url, :shortening)
    end
end
