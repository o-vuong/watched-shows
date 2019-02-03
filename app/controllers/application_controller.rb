require "./config/environment"

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, "public"
    set :views, "app/views"
    enable :sessions
    set :session_secret, "watched_shows"
  end

  get "/" do
    session[:welcome] = "welcome"
    erb :welcome
  end

  helpers do 
    def check
      if !logged_in?
        redirect "/login"
      end
    end

    def logged_in?
      !!session[:id]
    end


    def current_user
      User.find_by_id(session[:id])
    end

    
    def login(email,password)
      user = User.find_by(:email => email)
      if user && user.authenticate(password)
        session[:id] = user.id
      else
        redirect "/login"
      end
    end

    def logout!
      session.clear
      redirect "/"
    end
    end
end
