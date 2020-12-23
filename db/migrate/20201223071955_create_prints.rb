class CreatePrints < ActiveRecord::Migration[6.0]
  def change
    create_table :prints do |t|
      t.string :title
      t.string :text
      t.string :image
      t.timestamps
    end
  end
end
