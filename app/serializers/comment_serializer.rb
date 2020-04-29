class CommentSerializer
  include FastJsonapi::ObjectSerializer
  attributes :comment
  belongs_to :user
  belongs_to :bookmark
end
