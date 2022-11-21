ActiveAdmin.register Product do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  actions :all
  permit_params :name, :price, :size, :description, :image, :stock, :category_id
  # controller { actions :show, :index, :cancel }
  permit_params do
    permitted = %i[name price size description image stock category_id]
    permitted << :other if params[:action] == "create" && current_admin_user.admin?
    permitted
  end
end
