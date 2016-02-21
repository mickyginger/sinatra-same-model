class User < ActiveRecord::Base
  has_and_belongs_to_many(:friends,
    join_table: "users_friends",
    foreign_key: "user_id",
    association_foreign_key: "friend_id",
    class_name: "User"
  )
end