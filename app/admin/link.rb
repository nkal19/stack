ActiveAdmin.register Link do

  
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end

#we have added these lines to modify page
  index do 
    id_column
    column :category
    column :name
    column :url
    column :created_at 
    default_actions
  end
  
end
