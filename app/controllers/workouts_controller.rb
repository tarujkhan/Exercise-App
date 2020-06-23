        class WorkoutsController < ApplicationController
           
            get '/work_outs' do 
                if logged_in? 
               @workout = current_user.workouts && Workout.all
               erb :'/work_outs/index'
            else 
                redirect_if_not_logged_in
                end
            end


             get '/work_outs/new' do 
                if logged_in?
                @current_user
                erb :'/work_outs/newwork_out'
            else
                redirect_if_not_logged_in
                end
            end

             post '/work_outs' do 
                if logged_in?
                     @workout = current_user.workouts.build(params)
                if  !@workout.save
                     @errors = @workout.errors.full_messages
                     erb :'/work_outs/newwork_out'
            else 
                    redirect to '/work_outs'
                    end
                 else
                    redirect_if_not_logged_in
                end
            end

            get '/homepage' do
                if logged_in?
                    @user = User.find_by(user_name: params[:user_name])
                    @workouts = Workout.all
                    erb :'/work_outs/homepage'
                else 
                    redirect_if_not_logged_in
                end
            end

            get '/work_outs/:id' do 
                 @workout = Workout.find(params[:id])
                if logged_in? 
                    erb :'/work_outs/showwork_out' 
                else
                    redirect to '/login'
                    end
                end

            

            get '/work_outs/:id/edit' do
                @workout = Workout.find(params[:id])
                    if logged_in? && @workout.user == current_user
                       erb :'/work_outs/editwork_out'
                  else
                       redirect_if_not_logged_in
                     end
            end
                
                
            patch '/work_outs/:id' do
                    @workout = Workout.find(params[:id])
                if logged_in? && @workout.user == current_user
                 
                    @workout = Workout.find(params[:id])
                    @workout.name = params[:name]
                    @workout.date = params[:date]
                    @workout.numberofreps = params[:numberofreps]
                    @workout.duration = params[:duration]
                    @workout.save
                    redirect to("/work_outs/#{@workout.id}")
                 else 
                     @errors = @workout.errors.full_messages
                     erb :'/work_outs/editwork_out'
            
                     end
                
                  end
                
                  delete '/work_outs/:id/delete' do
                    @workout = Workout.find(params[:id])
                    if logged_in? && @workout.user == current_user
                    @workout.destroy
                    redirect to 'work_outs'
                   else
                    redirect_if_not_logged_in
                   end
                  end

                get '/advice' do
                    erb :'/work_outs/advice'
                 end 

    # http verbs 'the route' do 
            #     if logged_in? - to check if user is logged
            #         logic depending on the verb goes here
            #         the view erb related to that logic goes here 
            #     else 
            #         redirect to login page 
           #============================
            #show all user workouts on the index page including current user work outs
                #this particular thing is related to the index route showing all workouts

            #on the show page of each individual workouts only show edit and delete button for current user workouts
            #the show page for each work out that isn't created by current user does not have edit or delete actions
            #what condition can I write on the erb to only edit my workouts and not someone else's?
            #if this particular workout is not connected to the current user do not show edit or delete? otherwise show me.
