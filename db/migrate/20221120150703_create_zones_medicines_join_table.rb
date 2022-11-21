class CreateZonesMedicinesJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :zones, :medicines do |t|
      t.index :zone_id
      t.index :medicine_id
    end
  end
end
