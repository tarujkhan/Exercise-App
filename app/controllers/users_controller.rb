    class UsersController < ApplicationController

       get 'users/:slug' do
        @user = User.find_by_slug(params[:slug])
        erb :'views/showwork_out'
       end
    

       get '/register' do 
        if !logged_in?
            #if !session[:user_id]
            erb :'user/create_user'
        else 
            redirect to '/work_outs' 
            end
        end

        post '/register' do 
            if params[:user_name] == "" || params[:email] == "" || params[:password]
            #@user = User.new(params)
            #if !@user.save
            #@errors = @user.errors.full_messages 
            erb :"user/create_user"
         else
            @user = User.new(:user_name => params[:user_name], :email => params[:email], :password => params[:password])
            @user.save
            session[:user_id] = @user.id 
            redirect to '/work_outs'
            end
        end

        get '/login' do
            if !logged_in? 
            #if !session[:user_id] 
            erb :'user/login'
        else 
            redirect to '/work_outs'
            end
        end

        post '/login' do
        @user = User.find_by(:user_name => params[:user_name])
            if @user && @user.authenticate(params[:password])
            session[:user_id] = @user_id
            redirect to '/work_outs'
        else
            @errors = "The username or password is not correct."
            erb :'user/login'
            end
        end

        get '/logout' do
            if logged_in?
            #@user = current_user
            #@user = nil
            session.destroy
            redirect to '/login'
        else 
            redirect to '/'
            end
        end
    end

