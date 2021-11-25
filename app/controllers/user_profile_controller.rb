class UserProfileController < BasicAuthController
  skip_before_action :verify_authenticity_token
  layout "tesla"

  def index
    session[:data_stored ]  = nil
  end

  def update_user_results
    # user_feedback  = []
    # params[:user_results].each do |b|
    #   Result.find_by(user_profile_id:  params[:user_id], product_id: b['product_id']).update(feedback: b['garment_fit'])
    #   category = Product.find(b['product_id'])&.category
    #   user_feedback.push("#{category&.name} - #{b['size_chart_name']} : #{b['garment_fit']}")
    # end
    # UserProfile.find_by(email: params[:external_id]).update(user_feedback: user_feedback.join("\n"), other_feedback: params[:feedback])
    UserProfile.find_by(email: params[:external_id]).update(other_feedback: params[:feedback])
  end


  def thank_you

  end


end