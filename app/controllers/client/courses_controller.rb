class Client::CoursesController < Client::ApplicationController
  before_action :set_client_course, only: [:show]
  def show
  end

  private 
    def set_client_course
      @course = Client::UsersCourse.find_by(sales_courses_id: params[:course_id])&.sales_courses # para ele acessar realmente só o curso que possui; # o &.sales_courses é um condicional: ele vai tentar pegar a instância de sales_courses se ele achar uma instância primeiro  
    end
end
