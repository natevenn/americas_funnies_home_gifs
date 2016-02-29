class User < ActiveRecord::Base
  has_secure_password
  has_many :favorites, dependent: :destroy
  has_many :gifs, through: :favorites, dependent: :destroy

  enum role:  %w(default admin)
end
