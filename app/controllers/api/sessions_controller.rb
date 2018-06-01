class Api::SessionsController < ApplicationController

  def create
    @user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )
    if @user
      login(@user)
      render 'api/users/show'
    else
      render json: {"errors":{"session":['Invalid credentials']}}, status: 401
    end

  end
  def destroy
    if logged_in?
      logout
      render json: {}
    else
      render json: { "errors": { "session": ["404 Not found"]}}, status: 404
    end
  end
end
