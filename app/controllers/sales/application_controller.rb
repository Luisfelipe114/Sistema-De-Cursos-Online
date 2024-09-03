class Sales::ApplicationController < ApplicationController
  layout "sales"

  before_action :authorize

  def authorize
    if session[:seller].present?
      
      @seller = Sales::Seller.find(session[:seller])
      return if @seller.present?
    end

    redirect_to sales_login_path, notice: 'Faça login para acessar esse recurso'
  end
end
