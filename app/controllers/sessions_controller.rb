class SessionsController < ApplicationController
  def destroy
    session[:user_id] = nil
    flash[:notice] = 'logout'
    redirect_to root_url
  end
end
