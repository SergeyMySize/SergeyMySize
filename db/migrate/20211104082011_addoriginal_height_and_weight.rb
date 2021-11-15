class AddoriginalHeightAndWeight < ActiveRecord::Migration[5.2]
  def change
    add_column :user_profiles,:original_height, :float
    add_column :user_profiles,:original_weight, :float
  end
end
