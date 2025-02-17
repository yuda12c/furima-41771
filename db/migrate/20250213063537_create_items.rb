class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|

      t.string  :title,          null: false
      t.text    :detail,         null: false
      t.integer :category_id,    null: false
      t.integer :state_id,       null: false
      t.integer :delivery_id,    null: false
      t.integer :place_id,       null: false
      t.integer :dispatch_id,    null: false
      t.integer :price,          null: false
      t.references :user,        null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
