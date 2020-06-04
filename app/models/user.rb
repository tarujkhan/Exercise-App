class User < ActiveRecord::Base 
    has_many :workouts
    validates :user_name, :email, presence: true
    has_secure_password
end
