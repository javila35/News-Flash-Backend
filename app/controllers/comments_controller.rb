class CommentsController < ApplicationController
                                     
    def create
        comment = Comment.create(comment_params)
        render json: comment
    end


    private
    def comment_params
        params.require(:comment).permit(:user_id, :bookmark_id, :comment_text)
    end
end
