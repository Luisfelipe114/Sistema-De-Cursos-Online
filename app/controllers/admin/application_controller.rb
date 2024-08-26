class Admin::ApplicationController < ApplicationController
  layout "admin"

  before_action :authorize

  def authorize
    if session[:administrator].present?
      @administrator = Admin::Administrator.find(session[:administrator])
      return if @administrator.present?
    end

    redirect_to admin_login_path, notice: 'Faça login para acessar esse recurso'
  end
end
