class RemoveUserFromTweets < ActiveRecord::Migration[6.0]
  def change
    remove_reference :tweets, :user, null: false, foreign_key: true
    add_reference :tweets, :twitter_users, index: true, foreign_key: true, null: false
  end
end
