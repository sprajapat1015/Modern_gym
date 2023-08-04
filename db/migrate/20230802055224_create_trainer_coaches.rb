class CreateTrainerCoaches < ActiveRecord::Migration[7.0]
  def change
    create_table :trainer_coaches do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :expertise


      t.timestamps
    end
  end
end
