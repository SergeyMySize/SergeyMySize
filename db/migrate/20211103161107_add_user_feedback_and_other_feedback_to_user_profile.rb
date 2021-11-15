class AddUserFeedbackAndOtherFeedbackToUserProfile < ActiveRecord::Migration[5.2]
  def change
    add_column :user_profiles, :user_feedback, :text
    add_column :user_profiles, :other_feedback, :text
    remove_column :user_profiles, :fullest_part
  end
end
