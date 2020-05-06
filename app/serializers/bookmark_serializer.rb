class BookmarkSerializer
  include FastJsonapi::ObjectSerializer
  attributes :article_img, :article_link, :article_title
  belongs_to :user
  has_many :comments
end
