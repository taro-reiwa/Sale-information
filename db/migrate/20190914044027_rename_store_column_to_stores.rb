class RenameStoreColumnToStores < ActiveRecord::Migration[5.2]
  def change
    rename_column :stores, :store, :name
  end
end
