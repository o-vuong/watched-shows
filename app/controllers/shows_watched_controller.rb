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


  get '/shows/:id/edit' do
     #checks
     if !logged_in?
      redirect '/login'
    else
     if post = current_user.shows.find(params[:id])
      "Edit the show you watched" 
     else
      redirect '/shows'
     end
    end
  end





end
