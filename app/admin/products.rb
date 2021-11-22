ActiveAdmin.register Product do



  index do
    selectable_column
    id_column
    column :title
    column :logo
    column :size_chart_code
    column :gender
    column :category
    column :index
    actions
  end


  form do |f|
    f.inputs do
      f.input :title
      f.input :logo
      f.input :size_chart_code
      f.input :gender
      f.input :index
      f.input :category
    end
    f.actions
  end

  controller do

    def permitted_params

      params.permit!

    end

  end


end