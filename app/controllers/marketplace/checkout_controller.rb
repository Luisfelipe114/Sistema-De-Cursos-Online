class Marketplace::CheckoutController < Client::ApplicationController
  def index
    @course = Sales::Course.find(params[:course_id])
  end
end
