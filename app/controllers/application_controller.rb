class ApplicationController < ActionController::Base
	include ApplicationHelper
	protect_from_forgery with: :exception
	before_action :authenticate_user!
	before_action :store_user_location!, if: :storable_location?

	before_action :admin?, if: :admin_controller?
	private

	  def storable_location?
	  	request.get? && is_navigational_format? && !devise_controller? && !request.xhr?
	  end

	  def store_user_location!
	  	store_location_for(:user, request.fullpath)
	  end

	  def after_sign_in_path_for(resource_or_scope)
	  	stored_location_for(resource_or_scope) || super
	  end

	  def after_confirmation_path_for(resource_name, resource)
	    sign_in(resource)
	    root_path
	  end

	  def admin?
	  	unless current_user && current_user.admin?
	  	  flash[:notice] = "You must be an admin to access that page ;)"
	  	  redirect_to root_path
	  	end
	  	#puts "are you an admin?"
	  end

	  def admin_controller?
	  	prefix = controller_path.split("/").first
	  	if prefix == "admin"
	  	  return true
	  	end
	  	false
	  end

	  def admin_user?
	  	current_user.admin? ? true : false
	  end
end
