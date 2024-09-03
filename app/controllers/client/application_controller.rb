class Client::ApplicationController < ApplicationController
  layout "client"

  before_action :authorize

  def authorize
    if session[:user].present?

      @user = Client::User.find(session[:user])
      return if @user.present?
    end

    redirect_to client_login_path, notice: 'Faça login para acessar esse recurso'
  end
end
