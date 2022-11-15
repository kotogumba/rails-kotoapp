class CreateServices < ActiveRecord::Migration[7.0]
  def change
    create_table :services do |t|
      t.integer :client_id, references: :clients
      t.integer :doctor_id, references: :doctors
      t.integer :medicine_id, references: :medicines

      t.timestamps
    end
  end
end
