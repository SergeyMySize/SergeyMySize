ActiveAdmin.register Product do
  permit_params :title, :logo, :size_chart_code, :gender, :index
end