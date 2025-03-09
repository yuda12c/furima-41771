class CreateInformation < ActiveRecord::Migration[7.1]
  def change
    create_table :information do |t|
      t.references :buy, null: false, foreign_key: true
      t.string :postal_code, null: false
      t.integer :place_id, null: false
      t.string :city, null: false
      t.string :address, null: false
      t.string :building
      t.string :phone_number, null: false

      t.timestamps
    end
  end
end
