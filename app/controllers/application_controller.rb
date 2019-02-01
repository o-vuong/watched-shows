require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'watched_shows'
  end

  get "/" do
    session[:welcome] = 'welcome'
    response.set_cookie 'Shows watched' , 100
    erb :welcome
  end

  get '/foo' do
    "you've watched #{request.cookies['Shows watched']}"
  end

  helpers do 
    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= User.find_by(id: session{:user_id}) if session[:user_id] 
    end

    end
end
