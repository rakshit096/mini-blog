class SessionsController < ApplicationController

    def new
    end

    def create
        user=User.find_by(email: params[:email])

        if user && user.authenticate(params[:email])
            session[:user_id]=user.id

            redirect_to articles_path
        else
            flash.now[:alert]= "Invalid email or password"
            render :new, status: :unprocessable_entity
        end
    end

end
