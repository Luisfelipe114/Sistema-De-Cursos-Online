class Admin::AdministratorsController < ApplicationController
  layout "admin"
  before_action :set_admin_administrator, :set_admin_address, only: %i[ show edit update destroy ]


  # GET /admin/administrators or /admin/administrators.json
  def index
    @admin_administrators = Admin::Administrator.all
  end

  # GET /admin/administrators/1 or /admin/administrators/1.json
  def show
  end

  # GET /admin/administrators/new
  def new
    @admin_administrator = Admin::Administrator.new
  end

  # GET /admin/administrators/1/edit
  def edit
  end

  # POST /admin/administrators or /admin/administrators.json
  def create
    @admin_administrator = Admin::Administrator.new(admin_administrator_params)

    respond_to do |format|
      if @admin_administrator.save
        format.html { redirect_to admin_administrator_url(@admin_administrator), notice: "Administrator was successfully created." }
        format.json { render :show, status: :created, location: @admin_administrator }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @admin_administrator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/administrators/1 or /admin/administrators/1.json
  def update
    respond_to do |format|
      if @admin_administrator.update(admin_administrator_params)
        format.html { redirect_to admin_administrator_url(@admin_administrator), notice: "Administrator was successfully updated." }
        format.json { render :show, status: :ok, location: @admin_administrator }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @admin_administrator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/administrators/1 or /admin/administrators/1.json
  def destroy
    @admin_administrator.destroy!

    respond_to do |format|
      format.html { redirect_to admin_administrators_url, notice: "Administrator was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_administrator
      @admin_administrator = Admin::Administrator.find(params[:id])
    end

    def set_admin_address
      @address = @admin_administrator.admin_addresses.first
    end

    # Only allow a list of trusted parameters through.
    def admin_administrator_params
      params.require(:admin_administrator).permit(:nome, :cpf, :telefone, :email, :senha)
    end
end
