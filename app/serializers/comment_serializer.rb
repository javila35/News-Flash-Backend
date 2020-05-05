class CommentSerializer
  include FastJsonapi::ObjectSerializer
  attributes :comment_text, :user
  belongs_to :user
  belongs_to :bookmark
end
