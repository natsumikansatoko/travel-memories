ActiveAdmin.register Memory do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :user_id, :genre_id, :address, :latitude, :longitude, :district, :title, :body, :rate
  #
  # or
  #
  # permit_params do
  #   permitted = [:address, :latitude, :longitude, :district, :title, :body, :rate]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  index do
    selectable_column
    id_column
    column :user
    column :genre
    column :address
    column :district
    column :title
    column :body
    column :rate
    column :created_at
    column :updated_at
    actions
  end

  form do |f|
    f.inputs do
      f.input :user_id
      f.input :genre_id
      f.input :address
      f.input :district
      f.input :title
      f.input :body
      f.input :rate
    end
    f.actions
  end

end
