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
      #
      if params[:first_name]=="" || params[:phone]==""
        redirect to "/contacts/new"
      else
        @contact= current_user.contacts.build(params)
        if @contact.save
          redirect to "/contacts/#{@contact.id}"
        else
          redirect to "/contacts/new"
        end
      end
      #
    else
      redirect to "/"
    end
  end

  get "/contacts/:id" do
    if logged_in?
      @contact= Contact.find_by_id(params[:id])
      erb :'contacts/show'
    else
      redirect to '/'
    end
  end

  get "/contacts/:id/edit" do

  end

  patch "/contacts/:id" do

  end

  delete "/contacts/:id/delete" do

  end



end
