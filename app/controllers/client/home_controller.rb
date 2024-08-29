class Client::HomeController < Client::ApplicationController
  def index
    @courses = @user.courses
  end
end
