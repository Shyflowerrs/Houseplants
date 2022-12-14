ActiveAdmin.register Product do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  actions :all
  permit_params :name, :price, :size, :description, :image, :stock, :category_id, :sale, :main_image
  # controller { actions :show, :index, :cancel }
  # permit_params do
  #   permitted = %i[name price size description image stock category_id]
  #   permitted << :other if params[:action] == "create" && current_admin_user.admin?
  #   permitted
  # end
  form do |f|
    #   f.semantic_errors
    #   f.inputs
    # end
    f.semantic_errors
    f.inputs
    f.inputs do
      f.input :main_image, as:   :file,
                           hint: f.object.main_image.present? ? image_tag(f.object.main_image, size: "50x50") : ""
    end
    f.actions
  end
end
