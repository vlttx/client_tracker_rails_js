class ApplicationController < ActionController::Base
	 before_action :authenticate_user!
	  protect_from_forgery with: :exception
	  helper_method :current_user, :user_signed_in?, :user_session, :logged_in?, :destroy_user_session_path
	def home
	end

	def after_sign_in_path_for(resource)
    	request.env['omniauth.origin'] || root_path
	end

end


