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
    if params[:username] == "" || params[:password] == "" || params[:email] == ""
      redirect '/fail'
    else
      User.new(username: params[:username], password: params[:password], email: params[:email])
      redirect '/login'
    end

  end

  # GET: /login/5
  get "/login" do
    if !logged_in?
    erb :"./users/login"
    else
      redirect '/signup'
    end
  end

  post "/login" do
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect to "/shows_watched/index"
    else
      redirect to "/users/fail"
    end
  end

  # PATCH: /users/5
  patch "/users/:id" do
    redirect "/users/:id"
  end

end

