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
  
end
