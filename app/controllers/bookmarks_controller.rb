class BookmarksController < ApplicationController
  def create
    # TODO: Make this method less nested, only one :user deep
    # user = User.find(params[:user][:user][:id])
    user = User.find(params[:userId])
    bookmark = Bookmark.new
    bookmark.user = user
    bookmark.article_title = params[:articleTitle]
    bookmark.article_link = params[:articleLink]
    bookmark.article_img = params[:imgUrl]
    bookmark.save
    render json: bookmark
  end

  # Working on showing bookmark with comment.
  def show
    bookmark = Bookmark.find(params[:id])
    if bookmark
      render json: BookmarkSerializer.new(bookmark)
    else
      render json: { errors: "Bookmark not found." }
    end
  end

  private

  def bookmark_params
    params.require(:bookmarks).permit(:id, :user, :title, :link, :img_url)
  end
end
