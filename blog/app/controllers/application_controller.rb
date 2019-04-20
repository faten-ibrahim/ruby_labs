class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :inspect_user

    def inspect_user
        puts "--------\n\n\n\n\n"
        puts current_user.inspect
        
    end
    protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    end

end
