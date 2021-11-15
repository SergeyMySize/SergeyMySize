class AddMeasurementSystemToUserProfile < ActiveRecord::Migration[5.2]
  def change
    add_column :user_profiles, :measurement_system, :string
    add_column :user_profiles, :created_at, :datetime, null: false
    add_column :user_profiles, :updated_at, :datetime, null: false
    remove_column :user_profiles, :name

  end
end
