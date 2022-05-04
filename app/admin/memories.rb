ActiveAdmin.register Memory do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :user_id, :address, :latitude, :longitude, :district, :title, :body, :rate
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
    column :user_id
    column :genre_id
    column :address
    column :district
    column :title
    column :body
    column :rate
    column :created_at
    column :updated_at
    actions
  end

end
