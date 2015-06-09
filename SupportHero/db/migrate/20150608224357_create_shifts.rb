class CreateShifts < ActiveRecord::Migration
  def change
    create_table :shifts do |t|
      t.string :date
      t.integer :user_id
      t.boolean :avail
      t.boolean :weekend
      t.boolean :holiday

      t.timestamps null: false
    end
  end
end
