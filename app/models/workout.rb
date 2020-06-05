class Workout < ActiveRecord::Base
    belongs_to :user
    validates :name, :date, :numberofreps, :duration, presence: true

end
