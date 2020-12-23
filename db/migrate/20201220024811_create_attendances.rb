class CreateAttendances < ActiveRecord::Migration[6.0]
  def change
    create_table :attendances do |t|
      t.integer :presence_id,      null: false
      t.integer :breakfast_id,     null: false
      t.integer :bath_id,          null: false
      t.integer :temperture_id,    null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
