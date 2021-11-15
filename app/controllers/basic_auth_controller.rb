class BasicAuthController < ApplicationController



  http_basic_authenticate_with name: "tesla", password: "teslatesla12"

end