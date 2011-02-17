class CreateStories < ActiveRecord::Migration
  def self.up
    create_table :stories do |t|
      t.string :title
      t.string :edition
      t.string :column
      t.text :paragraphs

      t.timestamps
    end
  end

  def self.down
    drop_table :stories
  end
end
