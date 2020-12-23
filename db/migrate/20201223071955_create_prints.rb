class CreatePrints < ActiveRecord::Migration[6.0]
  def change
    create_table :prints do |t|
      t.string :title,    null: false
      t.string :text,     null: false
      t.string :image
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
