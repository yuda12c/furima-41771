class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|

      t.string  :title,          null: false
      t.text    :detail,         null: false
      t.integer :category_id,    null: false
      t.integer :state_id,       null: false
      t.integer :delivery_id,    null: false
      t.integer :place_id,       null: false
      t.integer :dispatch_day_id,null: false
      t.integer :price,          null: false
      
      t.timestamps
    end
  end
end
