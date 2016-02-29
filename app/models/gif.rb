class Gif < ActiveRecord::Base
  belongs_to :category
  has_many :favorites
  has_many :users, through: :favorites

  #create method to populate gifs
end
