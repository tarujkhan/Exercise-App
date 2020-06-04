class UsersController < ApplicationController

    get '/register' do 
    if !session[:user_id]
        erb :'create_user'
    else 
        redirect to '/work_outs' 
end
end

    post '/register' do
@user = User.new(params)
@errors = @user.errors.full_messages 
erb: "users/create_user"
else
    session[:user_id] = @user.id 
    redirect to 'work_outs'
end
end

get '/login' do 
    if !session[:user_id] 
        erb :'users/login'
    else 
        redirect to '/work_outs'
    end
end

post '/login'
@user = User.find_by(username: params[username])
if @user && @user.authenticate(params[password])
    session[:user_id] = @user_id
    redirect to '/work_outs'
else
    @errors = "The username or password is not correct"
    erb :/'login'
end
end

get '/logout'
if logged_in?
    session[:user_id] = nil
    session.destroy
    redirect '/login'
end
end
end 

