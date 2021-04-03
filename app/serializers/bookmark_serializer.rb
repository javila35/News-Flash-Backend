class BookmarkSerializer
  include FastJsonapi::ObjectSerializer
  attributes :article_img, :article_link, :article_title, :comments
end
