    
    class UsersController < ApplicationController

       get '/register' do 
                
            if !session[:user_id]
            erb :'user/create_user'
        else 
            redirect to '/work_outs' 
            end
        end

        post '/register' do 
            
            @user = User.new(params)
        
            if !@user.save
            @errors = @user.errors.full_messages 
                erb :"user/create_user"
            else
            session[:user_id] = @user.id 
                redirect to '/work_outs'
            end
        end

        get '/login' do
            if !session[:user_id] 
                erb :'user/login'
            else 
                redirect to '/work_outs'
            end
        end

        post '/login' do
        @user = User.find_by(user_name: params[:user_name])
            if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect to '/work_outs'
        else
            @errors = "The username or password is not correct."
            erb :'user/login'
            end
        end

        get '/logout' do
            if logged_in?
            @user = current_user
            @user = nil
            session.destroy
            redirect to '/'
        else 
            redirect to '/'
            end
        end
    
    end 
