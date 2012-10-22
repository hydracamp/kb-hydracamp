class Tweet < ActiveRecord::Base
  belongs_to :zombie_id
  attr_accessible :message
end
