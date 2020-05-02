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

    # Working on showing bookmark with comment.
    def show 
        bookmark = Bookmark.find(params[:id])
        comments = Comment.all.filter{|c| c.bookmark_id == bookmark.id}
        # replies = Reply.find_by(bookmark_id: bookmark.id)
        # currently rendering through comments of bookmarks, but i also need to render through comments for replies.
        byebug 
        # render json: bookmark;
    end

    private
    def bookmark_params
        params.require(:bookmarks).permit(:id, :user,:title,:link,:img_url)
    end
end
