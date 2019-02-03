class UsersController < ApplicationController
  get "/users/:id" do
    check
      redirect "/shows"
    @user = User.find(params[:id])
      if !@user.nil? && @user == current_user
        erb :"users/show.html"
      else
        redirect "/shows"
    end
  end

  get "/signup" do
      erb :"users/new.html"
      redirect to "/shows"
  end

  post "/signup" do 
      @user = User.create(params)
      session[:user_id] = @user.id
      redirect "/shows"
  end

  get "/login" do 
    @error_message = params[:error]
    check
      erb :"users/login.html"
      redirect "/shows"
  end

  post "/login" do
    @user = User.find_by(:username => params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "/shows"
    else
      redirect to "/signup"
    end
  end

  get "/logout" do
    if session[:user_id] != nil
      session.destroy
      redirect to "/login"
    else
      redirect to "/"
    end
  end

end