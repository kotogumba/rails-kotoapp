class AddQuantityAndCommentToServices < ActiveRecord::Migration[7.0]
  def change
    change_table :services do |t|
      t.integer :quantity
      t.text :comment
    end
  end
end
