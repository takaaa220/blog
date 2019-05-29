class SessionsController < ApplicationController
  before_action :redirect_with_login, only: %i(new create)

  def new
  end

  def create
    @login = LoginService.new(login_params)
    if user = @login.call
      session[:user_id] = user.id
      redirect_to root_path and return
    end

    render :new
  end

  def destroy
    session[:user_id].delete
    redirect_to root_path
  end

  private

  def login_params
    params.permit(:email, :password)
  end

  def redirect_with_login
    redirect_to root_path if current_user.present?
  end
end
