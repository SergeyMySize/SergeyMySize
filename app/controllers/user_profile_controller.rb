class UserProfileController < BasicAuthController
  skip_before_action :verify_authenticity_token
  layout "tesla"

  def index

  end

  def update_user_results
    user_feedback  = []
    params[:user_results].each do |b|
      user_feedback.push("#{b['size_chart_name']} : #{b['garment_fit']}")
    end
    UserProfile.find_by(email: params[:external_id]).update(user_feedback: user_feedback.join("\n"), other_feedback: params[:feedback])
  end


  def thank_you

  end


end