ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #

  permit_params :name, :email, :encrypted_password, :is_active


  index do
    selectable_column
    id_column
    column :name
    column :email
    column '投稿数' do |user|
      user.memories.count
    end
    column :is_active
    column :created_at
    column :updated_at
    actions
  end

  show do
    attributes_table do
    row :name
    row :email
    row :is_active
    row :created_at
    row :updated_at
    end
    active_admin_comments
  end


  filter :name
  filter :email
  filter :is_active
  filter :created_at
  filter :updated_at


  form do |f|
    f.inputs do
      f.input :name
      f.input :email
      f.input :is_active
    end
    f.actions
  end


  # or
  #
  # permit_params do
  #   permitted = [:name, :email, :encrypted_password, :is_active, :reset_password_token, :reset_password_sent_at, :remember_created_at]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
