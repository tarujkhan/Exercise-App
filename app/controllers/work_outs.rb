class WorkouTsController < ApplicationController
    get '/work_outs' do 
        if logged_in? 
            @exercises = current_user.exercises
            erb :'/workou_ts/index'
        else 
            redirect to '/login'
        end
end

    get '/work_outs/new' do 
        if logged_in?
            @current_user
    erb :'/work_outs/newwork_out'
        else
            redirect to '/login'
        end
    end

    post '/work_outs' do 
        if logged_in?
            @work_out = current_user.work_outs.build(params)
            if !@work_out.save
                @errors = @work_out.errors.full_messages
                erb :'/work_outs/newwork_out'
            else 
                redirect to '/work_outs'
            end
        else
            redirect to '/login'
        end
    end

    get '/work_outs/:id' do 
        @work_out = Work_out.find(params[:id])
        if logged_in? && @work_out.user == current_user
            erb :'/showwork_out' 
        else
            redirect to '/login'
        end
    end
end 