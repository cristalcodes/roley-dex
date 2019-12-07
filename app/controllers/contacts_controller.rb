class ContactsController < ApplicationController

  get "/contacts" do
    if logged_in?
      @user= current_user
      @contacts= @user.contacts
      erb :'contacts/index'
    else
      redirect to '/'
    end
  end

  get "/contacts/new" do
    if logged_in?
      erb :'contacts/new'
    else
      redirect to '/'
    end
  end

  post "/contacts" do
    if logged_in?
      if params[:first_name]=="" || params[:last_name]=="" || params[:phone]==""
        redirect to "/contacts/new"
      else
        @contact= current_user.contacts.build(params)
        if @contact.save
          redirect to "/contacts"
        else
          redirect to "/contacts/new"
        end
      end
    else
      redirect to "/"
    end
  end

  get "/contacts/:id" do
    if logged_in?
      user = current_user
      if @contact= user.contacts.find_by_id(params[:id])
        erb :'contacts/show'
      else
        redirect to '/'
      end
    else
      redirect to '/'
    end
  end

  get "/contacts/:id/edit" do
    if logged_in?
      user=current_user
      if @contact=user.contacts.find_by_id(params[:id])
        erb :'/contacts/edit'
      else
        redirect to "/contacts"
      end
    else
      redirect to "/"
    end
  end

  patch "/contacts/:id" do
    if logged_in?
      if params[:first_name]=="" || params[:last_name]=="" || params[:phone]==""
        redirect to "/contacts/#{params[:id]}/edit"
      else
        user = current_user
        @contact= user.contacts.find_by(id:params[:id])
        if @contact
          @contact.update(first_name:params[:first_name], last_name:params[:last_name], mailing_address:params[:mailing_address], phone:params[:phone], birthday:params[:birthday])
          redirect to "/contacts/#{@contact.id}"
        else
          redirect to "/"
        end
      end
    else
      redirect to "/"
    end
  end
   # contacts/#{@contact.id}/edit"

  delete "/contacts/:id/delete" do
    if logged_in?
      @contact=Contact.find_by_id(params[:id])
      if @contact && @contact.user==current_user
        @contact.delete
      end
      redirect to "/contacts"
    else
      redirect to '/'
    end
  end



end
