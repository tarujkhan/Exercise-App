class WorkouTsController < ApplicationController

  # GET: /workou_ts
  get "/workou_ts" do
    erb :"/workou_ts/index.html"
  end

  # GET: /workou_ts/new
  get "/workou_ts/new" do
    erb :"/workou_ts/new.html"
  end

  # POST: /workou_ts
  post "/workou_ts" do
    redirect "/workou_ts"
  end

  # GET: /workou_ts/5
  get "/workou_ts/:id" do
    erb :"/workou_ts/show.html"
  end

  # GET: /workou_ts/5/edit
  get "/workou_ts/:id/edit" do
    erb :"/workou_ts/edit.html"
  end

  # PATCH: /workou_ts/5
  patch "/workou_ts/:id" do
    redirect "/workou_ts/:id"
  end

  # DELETE: /workou_ts/5/delete
  delete "/workou_ts/:id/delete" do
    redirect "/workou_ts"
  end
end
