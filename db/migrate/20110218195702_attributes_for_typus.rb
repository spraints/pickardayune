class AttributesForTypus < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.string :role
    end
  end

  def self.down
    change_table :users do |t|
      t.remove :role
    end
  end
end
