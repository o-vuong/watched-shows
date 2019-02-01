class ShowsWatchedController < ApplicationController

  # GET: /shows_watched
  get "/shows_watched" do
    erb :"/shows_watched/index.html"
  end

  # GET: /shows_watched/new
  get "/shows_watched/new" do
    erb :"/shows_watched/new.html"
  end

  # POST: /shows_watched
  post "/shows_watched" do
    redirect "/shows_watched"
  end

  # GET: /shows_watched/5
  get "/shows_watched/:id" do
    erb :"/shows_watched/show.html"
  end

  # GET: /shows_watched/5/edit
  get "/shows_watched/:id/edit" do
    erb :"/shows_watched/edit.html"
  end

  # PATCH: /shows_watched/5
  patch "/shows_watched/:id" do
    redirect "/shows_watched/:id"
  end

  # DELETE: /shows_watched/5/delete
  delete "/shows_watched/:id/delete" do
    redirect "/shows_watched"
  end
end
