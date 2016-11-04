class User < ActiveRecord::Base
    has_many :tweets, dependent: :destroy #dependent destroy destroys any tweets associated with the user if the user is deleted
end