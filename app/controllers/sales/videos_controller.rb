class Sales::VideosController < Sales::ApplicationController
  before_action :set_video, only: %i[ show edit update destroy ]
  before_action :set_course

  # GET /sales/videos or /sales/videos.json
  def index
    @videos = @course.sales_videos
  end

  # GET /sales/videos/1 or /sales/videos/1.json
  def show
  end

  # GET /sales/videos/new
  def new
    @youtube_access_token = params[:access_token]
    @video = Sales::Video.new
  end

  # GET /sales/videos/1/edit
  def edit
    @youtube_access_token = params[:access_token]
  end

  # POST /sales/videos or /sales/videos.json
  def create
    @video = Sales::Video.new(video_params)

    respond_to do |format|
      if @video.save
        format.html { redirect_to sales_seller_course_videos_path(@seller, @course), notice: "Video was successfully created." }
        format.json { render :show, status: :created, location: @video }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sales/videos/1 or /sales/videos/1.json
  def update
    respond_to do |format|
      if @video.update(video_params)
        format.html { redirect_to sales_seller_course_videos_path(@seller, @course), notice: "Video was successfully updated." }
        format.json { render :show, status: :ok, location: @video }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales/videos/1 or /sales/videos/1.json
  def destroy
    @video.destroy!

    respond_to do |format|
      format.html { redirect_to sales_seller_course_videos_path(@seller, @course), notice: "Video was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = Sales::Video.find(params[:id])
    end

    def set_course
      @course = Sales::Course.find(params[:course_id])
    end

    # Only allow a list of trusted parameters through.
    def video_params
      params[:sales_video][:sales_courses_id] = params[:course_id]
      params.require(:sales_video).permit(:nome, :descricao, :link, :sales_courses_id, :embed)
    end
end
