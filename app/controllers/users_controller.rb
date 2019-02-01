class UsersController < ApplicationController

  get '/users/:uname' do
    @user = User.find_by_uname(params[:uname])
    erb :'users/show'
  end


  # GET: /users/new
  get "/signup" do
    if !logged_in?
    erb :"/users/new.html"
    else
      redirect to '/shows_watched/index'
    end
  end

  # POST: /users
  post "/signup" do
    if params[:username] == "" || params[:email] == "" || params[:password] == ""
      redirect to '/signup'
    else
      @user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
      @user.save
      session[:user_id] = @user.id
      redirect to '/shows/index'
    end
  end

  # GET: /login/5
  get "/login" do
    erb :"/users/show.html"
  end

  # GET: /users/5/edit
  get "/users/:id/edit" do
    erb :"/users/edit.html"
  end

  # PATCH: /users/5
  patch "/users/:id" do
    redirect "/users/:id"
  end

  # DELETE: /logout
  delete "/users/:id/delete" do
    redirect "/users"
  end
end
