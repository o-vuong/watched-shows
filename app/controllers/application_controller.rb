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
      !!session[:email]
    end

    def login(email)
      user = User.find_by(:email => email)
      if user && user.authenticate(password)
        session[:email] = user.email
      else
        redirect '/login'
      end
    end

    def logout!
      session.clear
    end
    end
end
