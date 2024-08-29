class Marketplace::CoursesController < Marketplace::ApplicationController
  before_action :set_course, only: :show

  def show
  end

  def set_course
    @course = Sales::Course.find(params[:id])
  end
end
