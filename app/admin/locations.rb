ActiveAdmin.register Location do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :name, :email, :city, :province, :address, :latitude, :longitude, :phone, :size, :height, :description, images: []
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

  show do |location|
    attributes_table do
      row :id
      row :name
      row :email
      row :city
      row :province
      row :address
      row :latitude
      row :longitude
      row :phone
      row :size
      row :height
      row :description
      row :images do
        ul do
          location.images.each do |image|
            li do
              image_tag image.variant(resize: '1024x768')
            end
            br
          end
        end
      end
    end
  end

  form do |f|
    inputs do
      f.input :name
      f.input :email
      f.input :city
      f.input :province
      f.input :address
      f.input :latitude
      f.input :longitude
      f.input :phone
      f.input :size
      f.input :height
      f.input :description
      f.input :images, as: :file, input_html: { multiple: true }
    end
    f.actions
  end
end
