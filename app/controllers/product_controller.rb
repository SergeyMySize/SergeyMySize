require 'httparty'

class ProductController < ApplicationController
  # layout "tesla"
  def index
    is_data_stored  = session[:data_stored ]  != nil
    user_results  = []
    if !is_data_stored
      user = UserProfile.create(email: params[:external_id])    
      user.update(gender: params[:gender], height: params[:height], weight: params[:weight],measurement_system: params[:measurement_system], bra_size: params[:bra_size], original_weight: params[:original_weight],belly_shape: params[:belly_shape],hip_shape: params[:hip_shape], original_height: params[:original_height])
    else
      user =UserProfile.find(session[:data_stored])
    end
    @products = Product.where(gender: [params[:gender],'unisex']).order(:index)
    @product_res = []
    @user_id  = user.id
    size_chart_codes = @products.pluck(:size_chart_code).uniq.join(',')
    @size_response = HTTParty.get("#{ENV['BACKEND_URL']}/sdk/external_users/me/garment_sizes?size_chart_codes_csv=#{size_chart_codes}&external_id=#{params[:external_id]}&sdk_key=#{ENV['SDK_KEY']}&sdk_secret=#{ENV['SDK_SECRET']}")
  


    arr = []

    @products.each_with_index do |product, index|
      category_id = product[:category_id]
      size_response = @size_response.select{|x| x["size_chart_code"]==product.size_chart_code }.first
      arr.push({
        product_id: product[:id], 
        size: size_response && size_response["size"],
        category_id: product[:category_id],
        title: product[:title],
        logo: product[:logo]
         })
     
    end

   arr = arr.group_by{ |product| product[:category_id]}

   @arr_res = []
   arr.each do |key,value|
    category = Category.find_by(id: key)
    @arr_res << {category: category.name, products: value,index: category.index}
   end


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
      user_results.push("#{b[:category_name]} - #{b[:title]} : #{b[:size]}")
    end



    user.update(user_results: user_results.join("\n"))

    if !is_data_stored
      @product_res.each do |prod_res|
        Result.create(user_profile_id: user.id, product_id: prod_res[:product_id], results: prod_res[:size])
      end
    end

    @arr_res = @arr_res.sort_by{|x|x[:index]}    
    session[:data_stored ]  = user.id
  end
end