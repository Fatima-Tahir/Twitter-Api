class Following < ApplicationRecord
    belongs_to :followee, foreign_key: :followed_id, class_name: "TwitterUser"
    belongs_to :follower, foreign_key: :follower_id, class_name: "TwitterUser"
end
