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
      render :show
    else
      flash[:errors] = ["Invalid email or password"]
      redirect_to new_sessions_url
    end
  end

  def show
    @user = current_user
    if @user
      render :show
    else
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end
