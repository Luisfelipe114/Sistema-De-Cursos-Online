class Sales::CoursesController < Sales::ApplicationController
  before_action :set_course, only: %i[ show edit update destroy ]

  # GET /sales/courses or /sales/courses.json
  def index
    @courses =  @seller.sales_courses
  end

  # GET /sales/courses/1 or /sales/courses/1.json
  def show
  end

  # GET /sales/courses/new
  def new
    @course = Sales::Course.new
  end

  # GET /sales/courses/1/edit
  def edit
  end

  # POST /sales/courses or /sales/courses.json
  def create
    @course = Sales::Course.new(course_params)

    respond_to do |format|
      if @course.save
        @course.picture.attach(params[:sales_course][:picture]) # active storage
        format.html { redirect_to sales_seller_courses_path(@seller), notice: "Course was successfully created." }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sales/courses/1 or /sales/courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        @course.picture.attach(params[:picture])
        format.html { redirect_to sales_seller_courses_path(@seller), notice: "Course was successfully updated." }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales/courses/1 or /sales/courses/1.json
  def destroy
    @course.destroy!

    respond_to do |format|
      format.html { redirect_to sales_seller_course_path(@seller), notice: "Course was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Sales::Course.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def course_params
      params[:sales_course][:sales_sellers_id] = params[:seller_id]
      params.require(:sales_course).permit(:nome, :descricao, :preco, :sales_sellers_id, :admin_categories_id, :picture)
    end
end
