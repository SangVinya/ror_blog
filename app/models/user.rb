# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  email           :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  has_secure_password

  has_many :posts, dependent: :destroy
  has_many :tags, through: :posts

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true

  after_create :sent_welcome_email

  ROLES = %w(admin manager user)

  def sent_welcome_email
    UserMailer.welcome(email, name).deliver!
  end
end
