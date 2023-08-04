class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.integer  :house_no
      t.string   :street
      t.string   :city
      t.string   :state
      t.integer  :postal_code
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
