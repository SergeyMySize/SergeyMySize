class AddUserResultsToUserProfile < ActiveRecord::Migration[5.2]
  def change
    add_column :user_profiles, :user_results, :text
  end
end
