class ShowsWatchedController < ApplicationController

  # GET: /shows_watched
  get "/shows" do
    "Welcome back, #{session[:username]}"
  end


  get '/shows/new' do
    #checks
    if !logged_in?
      #makes user login if not already
      redirect '/login'
    else
      "What show have you finished?" #render if logged in
    end
  end


  get '/posts/:id/edit' do
     #checks
     if !logged_in?
      #makes user login if not already
      redirect '/login'
    else
      "Edit form" #redir if logged in
    end
  end





end
