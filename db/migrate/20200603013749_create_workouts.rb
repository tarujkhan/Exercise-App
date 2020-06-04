class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.string :name
      t.date :date
      t.integer :numberofreps
      t.integer :duration
      t.timestamps null: false
    end
  end
end