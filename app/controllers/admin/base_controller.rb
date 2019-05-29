class Admin::BaseController < ApplicationController
  before_action :redirect_root_without_admin

  private

  def redirect_root_without_admin
    redirect_to root_path unless admin_login?
  end
end