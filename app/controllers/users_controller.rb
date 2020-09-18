class UsersController < ApplicationController
  before_action :authorized, except: [:new, :create]

  def new
  end

  def create
    if existing_user?
      check_user_login
    else
      sign_up_new_user
    end
    redirect_to root_path
  end

  private

  def existing_user?
    @user = User.find_by(username: params[:user]['username'])
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end

  def check_user_login
    if @user && @user.authenticate(params[:user]['password'])
      session[:user_id] = @user.id
      flash[:notice] = 'login'
    else
      flash[:error] = 'login error'
    end
  end

  def sign_up_new_user
    @user = User.new(user_params)
    if @user.save!
      session[:user_id] = @user.id
      flash[:notice] = 'signup'
    else
      flash[:error] = 'signup error'
    end
  end
end
