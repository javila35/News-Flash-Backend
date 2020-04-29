class CommentsController < ApplicationController

    def create
        byebug
        comment = Comment.create(params)
    end


    private
    def comment_params
        params.require(:comment).permit(:user_id,:bookmark_id,:comment)
    end
end
