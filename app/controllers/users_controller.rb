class UsersController < ApplicationController

  get "/" do
    if logged_in?#if logged in is true
      redirect to '/contacts'
    else
      erb :welcome
    end
  end

  post '/signup' do
    params.to_s
    if params[:first_name]=="" || params[:last_name]=="" || params[:email]=="" || params[:password]==""
      redirect to '/signup'
    else
      @user=User.new(first_name: params[:first_name],last_name:params[:last_name], email:params[:email], password:params[:password])
      @user.save
      session[:user_id]=@user.id
      redirect to '/contacts'
    end
  end



end
