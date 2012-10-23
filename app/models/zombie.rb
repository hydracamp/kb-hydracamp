class Zombie < ActiveRecord::Base
  attr_accessible :graveyard, :name
  has_many :tweets

  validates :name, :presence=> true, :uniqueness=> true
end
