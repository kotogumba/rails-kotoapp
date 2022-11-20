class CreateZones < ActiveRecord::Migration[7.0]
  def change
    create_table :zones do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
