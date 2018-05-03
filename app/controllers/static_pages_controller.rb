class StaticPagesController < ApplicationController
  def home
    @bookmark = Bookmark.new
  end

  def search
    # if params[:bookmark_title]
      # @bookmark = find_bookmark(params)
      @bookmarks = Bookmark.paginate(page: params[:page])
      # find_bookmarks(params).paginate(page: params[:page])
    # end
  end

  private
    # quite simple and stupid search,returns just one exact result
    def find_bookmark(params)
      Bookmark.find_by(title: params[:bookmark_title])
    end

    # more fuzzy search, returns many results
    def find_bookmarks(params)
      title = params[:bookmark_title]
      Bookmark.where("title LIKE '%#{title}%'")
    end
end
