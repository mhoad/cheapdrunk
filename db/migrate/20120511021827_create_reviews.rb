class CreateReviews < ActiveRecord::Migration
  def self.up
    create_table :reviews do |t|
      t.text :comment
      t.integer :rating
      t.integer :venue_id
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :reviews
  end
end
