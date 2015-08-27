class Tag < ActiveRecord::Base
  # Remember to create a migration!
  has_many :posttags
  has_many :posts, through: :posttags

  validates :tag, presence: true

  before_save :downcase_tag


  private

  def downcase_tag
    self.tag = self.tag.downcase
  end
end
