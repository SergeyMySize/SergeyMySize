class Result < ActiveRecord::Base
  belongs_to :user_profile
  belongs_to :product
end