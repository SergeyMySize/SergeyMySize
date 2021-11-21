ActiveAdmin.register UserProfile do

  remove_filter :user_profile_roles
  #ransacker :my_custom_filter, formatter: -> (category_id) {
  #  ids = MyModel.where(category_id: category_id).pluck(:id) # return only id-s of returned items.
  #  ids.present? ? ids : nil # return ids OR nil!
  #} do |parent| # not sure why this is needed .. but it is :)
  #  parent.table[:id]
  #end

  #filter :"user_profile_id" , :as => :select, :collection => UserProfile.all.map(&:email)

  # index do
   
  #   id_column

  #   column :email
  #   column :height
  #   column :weight
  #   column :gender
  #   column :bra_size
  #   column :measurement_system
  #   column :created_at
  #   column :updated_at
  #   column :user_results 
  #   column :user_feedback
  #   column :other_feedback
  #   column :original_height
  #   column :original_weight
  #   column :belly_shape
  #   column :hip_shape
   
  # end
end
