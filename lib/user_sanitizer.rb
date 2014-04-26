class User::ParameterSanitizer < Devise::ParameterSanitizer
    private
    def account_update
        default_params.permit(:email, :handle, :network, :password, :password_confirmation, :current_password)
    end

     def sign_up
        default_params.permit(:email, :handle, :network, :password, :password_confirmation, :current_password)
    end
end