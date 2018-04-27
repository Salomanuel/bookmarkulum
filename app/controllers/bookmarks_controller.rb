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
  
  def edit
    @bookmark = Bookmark.find(params[:id])
  end

  def update
    @bookmark = Bookmark.find(params[:id])
    if @bookmark.update_attributes(bookmark_params)
      redirect_to @bookmark # all is good
    else
      render inline: "<p><%= @bookmark.errors.messages %></p>"
    end
  end

  def destroy
    Bookmark.find(params[:id]).destroy
    redirect_to bookmarks_url
  end


 

  private

    def bookmark_params
      params.require(:bookmark).permit(
        :title, :url, :shortening)
    end
end
