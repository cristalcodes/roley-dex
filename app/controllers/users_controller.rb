class UsersController < ApplicationController

  get "/" do
    if logged_in?#if logged in is true
      redirect to '/contacts'
    else
      erb :welcome
    end
  end



  post '/signup' do
    @user=User.new(params)
    if @user.save
      session[:user_id]=@user.id
      redirect to '/contacts'
    else
      erb :'welcome'
    end
  end

  post '/login' do
    user= User.find_by(email:params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id]=user.id
      redirect to "/contacts"
    else
      redirect to "/"
    end
  end


  get "/logout" do
    if logged_in?
      session.clear
      redirect to "/"
    else
      redirect to "/"
    end
  end



end
