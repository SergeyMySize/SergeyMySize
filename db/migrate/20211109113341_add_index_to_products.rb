class AddIndexToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :index, :integer
  end
end
