class SessionsController < ApplicationController
    def create
        puts "inside session"
        puts request.env["omniauth.auth"].credentials.refresh_token
        user = User.from_omniauth(request.env["omniauth.auth"])
        session[:user_id] = user.id
        #puts user.to_yaml
        redirect_to root_url
    end

    def destroy
        session[:user_id] = nil
        redirect_to root_url
    end
end