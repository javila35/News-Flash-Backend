class BookmarksController < ApplicationController
    def create
        user = User.find(params[:user][:user][:id])
        bookmark = Bookmark.new
        bookmark.user = user
        bookmark.article_title = params[:title]
        bookmark.article_link = params[:link]
        bookmark.article_img = params[:img_url]
        bookmark.save
        render json: bookmark
    end

    private
    def bookmark_params
        params.require(:bookmarks).permit(:user,:title,:link,:img_url)
    end
end
