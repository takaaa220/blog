class ApplicationController < ActionController::Base
  if Rails.env.production?
    rescue_from StandardError, with: :render_500
    rescue_from ActiveRecord::RecordNotFound, ActionController::RoutingError, with: :render_404
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  protected

  def not_found
    raise ActiveRecord::RecordNotFound
  end

  def admin_login?
    !!current_user&.admin?
  end

  def user_login?
    !!current_user&.user?
  end

  private

  def render_404
    render "errors/404"
  end

  def render_500
    render "errors/500"
  end

  helper_method :admin_login?
end
