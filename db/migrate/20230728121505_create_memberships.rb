class CreateMemberships < ActiveRecord::Migration[7.0]
  def change
    create_table :memberships do |t|
      t.date     :start_date
      t.date     :end_date
      t.string   :status
      t.references :user,  foreign_key: true

      t.timestamps
    end
  end
end
