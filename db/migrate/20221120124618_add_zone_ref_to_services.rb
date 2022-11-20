class AddZoneRefToServices < ActiveRecord::Migration[7.0]
  def change
    add_reference :services, :zone, foreign_key: true
  end
end
