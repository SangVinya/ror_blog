# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string
#  text       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  image      :string
#

class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :tags
  belongs_to :user

  validates :title, presence: true, length: { minimum: 3 }, uniqueness: { scope: :user }
  validates :user, presence: true
  # validates :text, precence: { if: lambda { |post| post.title.size > 10 } }

  scope :admin_posts, -> { where(user_id: 1) }
  scope :by_date, -> { order(:created_at) }

  mount_uploader :image, PostImageUploader
end
