class CreateMedicines < ActiveRecord::Migration[7.0]
  def change
    create_table :medicines do |t|
      t.string :title
      t.string :description
      t.integer :price
      t.integer :quantity

      t.timestamps
    end
  end
end
