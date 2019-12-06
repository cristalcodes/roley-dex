class UsersController < ApplicationController

  get "/" do
    if logged_in?#if logged in is true
      redirect to '/contacts'
    else
      erb :welcome
    end
  end

  post '/signup' do
    if params[:first_name]=="" || params[:last_name]=="" || params[:email]=="" || params[:password]==""
      redirect to '/signup'
    else
      @user=User.new(first_name: params[:first_name],last_name:params[:last_name], email:params[:email], password:params[:password])
      @user.save
      session[:user_id]=@user.id
      redirect to '/contacts'
    end
  end

  post '/login' do
    user=User.find_by(email:params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id]=user.id
      redirect to "/contacts"
    else
      redirect to "/"
    end
  end

  get "/user" do
    if logged_in?
      @user=current_user
      erb :'users/show'
    else
      redirect to "/"
    end
  end

  get "/user/:id/edit" do #ASK NANCY IF WE DID THIS RIGHT.
    @user=User.find_by_id(params[:id])
    if @user && @user==current_user
      erb :'users/edit.erb'
    else
      redirect to "/"
    end
  end

  patch "/user/:id" do

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
