class AddStoreToStores < ActiveRecord::Migration[5.2]
  def change
    add_column :stores, :store, :string
  end
end
