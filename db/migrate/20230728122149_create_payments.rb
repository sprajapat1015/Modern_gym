class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.integer  :amount
      t.date     :payment_date
      t.references :user,  foreign_key: true
      t.references :membership, foreign_key: true

      t.timestamps
    end
  end
end



