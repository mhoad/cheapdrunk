class CreateVenues < ActiveRecord::Migration
  def self.up
    create_table :venues do |t|
      t.string :name
      t.text :description
      t.string :street_address
      t.integer :postcode
      t.string :suburb
      t.string :phone_number
      t.string :email
      t.string :url

      t.timestamps
    end
  end

  def self.down
    drop_table :venues
  end
end
