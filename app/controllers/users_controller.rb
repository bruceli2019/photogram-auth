class UsersController < ApplicationController
    
    def index
        @users = User.all
        
        render("/users/index.html.erb")
    end
    
    def show
        @user_id = current_user
        
        render("/users/show.html.erb")
    end
    
    def my_likes
        @user_id = current_user.id
        
        render("/users/my_likes.html.erb")
    end

    
end