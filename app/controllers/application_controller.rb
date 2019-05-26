class ApplicationController < ActionController::Base
  unless Rails.env.development?
    rescue_from StandardError, with: :render_500
    rescue_from ActiveRecord::RecordNotFound, ActionController::RoutingError, with: :render_404
  end

  private

  def render_404
    render "errors/404"
  end

  def render_500
    render "errors/500"
  end
end
