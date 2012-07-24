class SessionsController < ApplicationController


  def new
    #sign in form here, with get request and link to register. Submit will POST to the create method
  end

  def create
    #creates a session and makes a COOOOOOOOOKIE????? on their computer
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      #CREATE COOKIE
      redirect_to '/links'
    else
      flash.now[:error] = "Invalid email/password combination"
      render 'new'
    end
  end

  def destroy
    reset_session
    render '/links'
  end

end
