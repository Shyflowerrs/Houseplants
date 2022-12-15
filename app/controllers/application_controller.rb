class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_render_cart
  before_action :initialize_cart
  def set_render_cart
    @render_cart = true
  end

  def initialize_cart
    @cart ||= Cart.find_by(id: session[:cart_id])

    if @cart.nil?
      @cart = Cart.create
      session[:cart_id] = @cart.id
    end
  end
  # before_action :configure_permitted_parameters, if: :devise_controller?

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up) do |u|
  #     u.permit(:username, :email, :password)
  #   end

  #   devise_parameter_sanitizer.permit(:account_update) do |u|
  #     u.permit(:username, :email, :password, :current_password)
  #   end
  # end
end
