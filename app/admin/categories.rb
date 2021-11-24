ActiveAdmin.register Category do
  permit_params :name

  index do
    selectable_column
    id_column
    column :name
    column :index
    actions
  end

  filter :name

  form do |f|
    f.inputs do
      f.input :name
      f.input :index
    end
    f.actions
  end


  controller do

    def permitted_params

      params.permit!

    end

  end

end