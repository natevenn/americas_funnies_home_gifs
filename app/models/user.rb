class User < ActiveRecord::Base
  has_secure_password
  has_many :favorites
  has_many :gifs, through: :favorites

  enum role:  %w(default admin)
end
