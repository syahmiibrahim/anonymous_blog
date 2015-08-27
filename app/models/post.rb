class Post < ActiveRecord::Base
  # Remember to create a migration!
  has_many :posttags
  has_many :tags, through: :posttags

  validates :post_title, presence: true
  validates :post_body, presence: true

end
