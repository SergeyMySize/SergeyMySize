require 'httparty'

class ProductController < ApplicationController
  layout "tesla"
  def index
    user_results  = []
    user = UserProfile.create(email: params[:external_id]);
    user.update(gender: params[:gender], height: params[:height], weight: params[:weight],measurement_system: params[:measurement_system], bra_size: params[:bra_size], original_weight: params[:original_weight],belly_shape: params[:belly_shape],hip_shape: params[:hip_shape], original_height: params[:original_height])
    @products = Product.where(gender: [params[:gender],'unisex']).order(:index)
    @product_res = []
    @user_id  = user.id
    size_chart_codes = @products.pluck(:size_chart_code).uniq.join(',')
    pp "#{ENV['BACKEND_URL']}/sdk/external_users/me/garment_sizes?size_chart_codes_csv=#{size_chart_codes}&external_id=#{params[:external_id]}&sdk_key=#{ENV['SDK_KEY']}&sdk_secret=#{ENV['SDK_SECRET']}"
    @size_response = HTTParty.get("#{ENV['BACKEND_URL']}/sdk/external_users/me/garment_sizes?size_chart_codes_csv=#{size_chart_codes}&external_id=#{params[:external_id]}&sdk_key=#{ENV['SDK_KEY']}&sdk_secret=#{ENV['SDK_SECRET']}")
    pp @size_response
    @gender = params[:gender]
    @external_id = params[:external_id]
    @products.each do |product|
      @size_response.each { |sr|
        if sr['size_chart_code'] == product.size_chart_code
         category = Category.find_by(id: product.category_id);
          @product_res << {title: product.title, logo: product.logo, size: sr['size'], product_id: product.id, category_name: category&.name}
        end
      }
    end
    @product_res.each do |b|
      user_results.push("#{b[:title]} : #{b[:size]}")
    end
    user.update(user_results: user_results.join("\n"))
    @product_res.each do |prod_res|
      pp prod_res
      Result.create(user_profile_id: user.id, product_id: prod_res[:product_id], results: prod_res[:size])
    end
  end
end