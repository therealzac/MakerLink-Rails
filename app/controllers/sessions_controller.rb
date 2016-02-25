class SessionsController < ApplicationController
  def new
    render :layout => "empty"
  end

  def landing
    render :layout => "empty"
  end

  def create
    @user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )

    if @user
      sign_in(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = ["Invalid email or password"]
      render :new
    end
  end

  def show
    @user = current_user
    if @user
      redirect_to user_url(@user)
    else
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to new_session_url
  end
end
