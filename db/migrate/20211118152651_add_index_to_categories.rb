class AddIndexToCategories < ActiveRecord::Migration[5.2]
    def change
        add_column :categories, :index, :integer
    end
  end
  