class TwitterUser < ApplicationRecord

  validates :username, :email, :password, presence: true
  validates :password, length: { maximum: 6 }

  has_many :tweets

  has_many :followed_users, foreign_key: :follower_id, class_name: "Following"
  has_many :followees, through: :followed_users, source: :followee

  has_many :follower_users, foreign_key: :followed_id, class_name: "Following"
  has_many :followers, through: :follower_users, source: :follower

  acts_as_voter

  def unfollow(other_user)
    followees.delete(other_user)
  end

  def follow(other_user)
    followees << other_user unless self == other_user
  end
end
