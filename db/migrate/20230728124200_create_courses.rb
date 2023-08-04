class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.string   :class_name
      t.string   :description
      t.datetime :start_time
      t.datetime :end_time
      t.integer  :capacity
      t.references :trainer_coach, null: false, foreign_key: true

      t.timestamps
    end
  end
end
