class RenameDispatchDayToDispatchInItems < ActiveRecord::Migration[7.1]
  def change
    rename_column :items, :dispatch_day_id, :dispatch_id
  end
end
