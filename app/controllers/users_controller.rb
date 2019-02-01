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
    if params[:username] == "" || params[:email] == "" || params[:password_digest] == ""
      redirect to '/signup'
    else
      user = User.new(username: params["username"], password: params["password_digest"], email: params["email"])
      user.save
      session[:user_id] = @user.id
      redirect to '/shows/index'
    end

  end

  # GET: /login/5
  get "/login" do
    if !logged_in?
    erb :"/users/login"
    else
      redirect '/signup'
    end
  end

  post '/login' do
    user = User.find_by(username: params[:username] , password: params[:password_digest])
    if user && user.authenticate(params[:password_digest])
      session[:user_id] = user.id
      redirect "/tweets"
    else
      redirect to '/signup'
    end
  end

  # PATCH: /users/5
  patch "/users/:id" do
    redirect "/users/:id"
  end

end

