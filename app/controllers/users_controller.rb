class UsersController < ApplicationController
  def new
    render :layout => "empty"
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in(@user)
      redirect_to 'sessions#show'
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to new_user_url
    end
  end

  def update
    @user = User.find(params[:id])
    if params[:user]
      @user.cohort_id = params[:user][:cohort_id]
      @user.school_id = params[:user][:school_id]
      @user.project_id = params[:user][:project_id]
      @user.first_name = params[:user][:first_name]
      @user.last_name = params[:user][:last_name]
      @user.email = params[:user][:email]
      @user.pic_url = params[:user][:pic_url]
    end

    @user.save!
    render :show
  end

  private
  def user_params
    params.require(:user).permit(
      :password,
      :mobile,
      :email,
      :cohort_id,
      :school_id,
      :project_id,
      :first_name,
      :last_name,
      :pic_url
    )
  end
end
