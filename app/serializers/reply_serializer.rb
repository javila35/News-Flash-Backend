class ReplySerializer
  include FastJsonapi::ObjectSerializer
  attributes :reply
  belongs_to :comment
  belongs_to :user
end
