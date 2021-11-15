class AddBellyShapeAndHipShapeToUserProfile < ActiveRecord::Migration[5.2]
  def change
    add_column :user_profiles, :belly_shape, :string
    add_column :user_profiles, :hip_shape, :string
  end
end
