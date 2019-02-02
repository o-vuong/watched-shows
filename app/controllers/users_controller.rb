class UsersController < ApplicationController
  get '/users/:id' do
    if !logged_in?
      redirect '/shows'
    end

    @user = User.find(params[:id])
    if !@user.nil? && @user == current_user
      erb :'users/show.html'
    else
      redirect '/shows'
    end
  end

  get '/signup' do
    if !session[:user_id]
      erb :'users/new.html'
    else
      redirect to '/shows'
    end
  end

  post '/signup' do 
    if params[:username] == "" || params[:password] == ""
      redirect to '/signup'
    else
      @user = User.create(params)
      binding.pry
      session[:user_id] = @user.id
      redirect '/shows'
    end
  end

  get '/login' do 
    @error_message = params[:error]
    if !session[:user_id]
      erb :'users/login.html'
    else
      redirect '/shows'
    end
  end

  post '/login' do
    @user = User.find_by(:username => params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "/shows"
    else
      redirect to '/signup'
    end
  end

  get '/logout' do
    if session[:user_id] != nil
      session.destroy
      redirect to '/login'
    else
      redirect to '/'
    end
  end

end