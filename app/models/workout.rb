class Workout < ActiveRecord::Base
    belongs_to :user
    validates :workout, :date, :numberofreps, :duaration, presence: true

end
