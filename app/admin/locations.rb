ActiveAdmin.register Location do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :name, :published, :email, :city, :province, :address, :latitude, :longitude, :phone, :size, :height, :description, images: []
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end


action_item :toggle_publication, only: :show do
  button_text = resource.published? ?  'Unpublish' : 'Publish'
  button_to button_text, toggle_publication_admin_location_path(resource), method: :put
end

member_action :toggle_publication, method: :put do
  resource.toggle_publication!
  notice = resource.reload.published? ? 'The study has been published' : 'The study is no longer published'
  redirect_to resource_path, notice: notice
end


  show do |location|
    attributes_table do
      row :id
      row :name
      row :published
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
      f.input :published
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
