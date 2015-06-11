class CreateShifts < ActiveRecord::Migration
  def change
    create_table :shifts do |t|
      t.date :date
      t.integer :user_id
      t.boolean :avail, default: true
      t.boolean :weekend
      t.boolean :holiday

      t.timestamps null: false
    end
  end
end
