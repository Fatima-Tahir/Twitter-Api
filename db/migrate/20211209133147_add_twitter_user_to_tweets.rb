class AddTwitterUserToTweets < ActiveRecord::Migration[6.0]
  def change
    remove_reference :tweets, :twitter_users, null: false, foreign_key: true
    add_reference :tweets, :twitter_user, null: false, foreign_key: true
  end
end
