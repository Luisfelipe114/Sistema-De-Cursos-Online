class Marketplace::ApplicationController < ApplicationController
  before_action :is_user_logged?

  layout :choose_layout

  def is_user_logged?
    if session[:user].present?
      @user = Client::User.find(session[:user])
    end
  end

  private
    def choose_layout
      @user.present? ? "client" : "application"
    end
end