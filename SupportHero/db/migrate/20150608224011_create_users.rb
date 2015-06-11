class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.date :last_skipped_shift, default: Date.today - 30

      t.timestamps null: false
    end
  end
end
