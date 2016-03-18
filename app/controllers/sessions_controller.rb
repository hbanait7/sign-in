class SessionsController < ApplicationController
  
  def new

  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      sign_in_count(user)
      redirect_to root_url
      flash[:notice] = 'Signed In'
    else
      flash.now[:alert] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

end
