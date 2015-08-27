class Tag < ActiveRecord::Base
  # Remember to create a migration!
  has_many :posttags
  has_many :posts, through: :posttags
end
