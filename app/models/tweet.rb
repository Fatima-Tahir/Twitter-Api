class Tweet < ApplicationRecord
  acts_as_votable
  
  belongs_to :twitter_user

  validates :body, presence: true, length: { maximum: 140 }
  validates :twitter_user_id, presence: true
end
