class WorkOuts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.string :name
      t.date :date
      t.integer :numberofreps
      t.integer :duration
      t.integer :user_id
  end
end
end