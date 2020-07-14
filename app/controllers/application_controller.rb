class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?



	protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.permite(:sign_up, keys: [:name, :email])
		devise_parameter_sanitizer.permite(:sign_in, keys: [:name])
	end
end
