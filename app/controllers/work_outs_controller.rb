        class WorkOutController < ApplicationController

            get '/work_outs' do 
                if logged_in? 
                @workout = current_user.workout
           #@workout = WorkOut.where(current_user.id: workout.user_id)
                 erb :'/workou_ts/showwork_out'
            else 
                redirect to '/login'
                end
            end


             get '/work_outs/new' do 
                if logged_in?
                @current_user
                @workout = WorkOut.new(params[:workout])
           #workout.user_id = current_user.id
                erb :'/workou_ts/newwork_out'
            else
                redirect to '/login'
                end
            end

             post '/work_outs' do 
                if logged_in?
                @workout = current_user.work_outs.build(params)
                if !@workout.save
                @errors = @workout.errors.full_messages
                erb :'/workou_ts/newwork_out'
            else 
                redirect to '/work_outs'
                end
                 else
                    redirect to '/login'
                end
            end

            get '/work_outs/:id' do 
                @workout = WorkOut.find(params[:id])
                    if logged_in? && @workout.user == current_user
                    erb :'/workou_ts/showwork_out' 
                else
                    redirect to '/login'
                    end
                end

            get '/work_outs/:id/edit' do
                   @workout = WorkOut.find(params[:id])
                    if logged_in? && @workout.user == current_user
                      workout = WorkOut.find(params[:id])
                      @user = User.find(session[:user_id])
                      erb :'/workou_ts/editwork_out'
                  else
                    redirect to '/login'
                end
            end
                
                
            patch '/work_outs/:id' do
                    @workout = WorkOut.find(params[:id])
                    @workout.name = params[:name]
                    @workout.date = params[:date]
                    @expense.numberofreps = params[:numberofreps]
                    @expense.duration = params[:duration]
                
                    if !@expense.save
                    @errors = @workout.errors.full_messages
                    erb :'/workou_ts/editwork_out'
                    else
                    redirect to("/work_outs/#{@workout.id}")
                
                    end
                
                  end
                               
                
                  delete '/work_outs/:id/delete' do
                    @workout = WorkOut.find(params[:id])
                    if logged_in? && @workout.user == current_user
                    @workout.destroy
                    redirect to 'work_outs'
                   else
                   redirect to '/login'
                   end
                end
            end 