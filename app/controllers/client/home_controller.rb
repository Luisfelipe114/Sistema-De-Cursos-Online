class Client::HomeController < Client::ApplicationController
  def index
    debugger
    @courses = @user.courses
  end
end
