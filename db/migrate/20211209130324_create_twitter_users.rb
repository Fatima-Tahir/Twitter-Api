class CreateTwitterUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :twitter_users do |t|
      t.string :username,  null: false, default: ""
      t.string :email, null: false, default: ""
      t.string :password, null: false, default: ""

      t.timestamps
    end
  end
end
