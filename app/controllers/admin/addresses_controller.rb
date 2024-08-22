class Admin::AddressesController < ApplicationController
  layout "admin"
  before_action :set_address, only: %i[ show edit update destroy ]
  before_action :set_admin

  # GET /admin/addresses or /admin/addresses.json
  def index
    @addresses = @administrator.admin_addresses
  end

  # GET /admin/addresses/1 or /admin/addresses/1.json
  def show
  end

  # GET /admin/addresses/new
  def new
    @address = Admin::Address.new
  end

  # GET /admin/addresses/1/edit
  def edit
  end

  # POST /admin/addresses or /admin/addresses.json
  def create
    @address = Admin::Address.new(admin_address_params)

    respond_to do |format|
      if @address.save
        format.html { redirect_to admin_administrator_addresses_path(@administrator), notice: "Endereço criado com sucesso." }
        format.json { render :show, status: :created, location: @address }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @admin_address.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/addresses/1 or /admin/addresses/1.json
  def update
    respond_to do |format|
      if @address.update(admin_address_params)
        format.html { edirect_to admin_administrator_addresses_path(@administrator), notice: "Address was successfully updated." }
        format.json { render :show, status: :ok, location: @address }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @admin_address.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/addresses/1 or /admin/addresses/1.json
  def destroy
    @address.destroy!

    respond_to do |format|
      format.html { edirect_to admin_administrator_addresses_path(@administrator), notice: "Address was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_address
      @address = Admin::Address.find(params[:id])
    end

    def set_admin
      @administrator = Admin::Administrator.find(params[:administrator_id])
    end

    # Only allow a list of trusted parameters through.
    def admin_address_params
      params[:admin_address][:admin_administrators_id] = params[:administrator_id]
      params.require(:admin_address).permit(:rua, :numero, :bairro, :cep, :bairro, :estado, :admin_administrators_id)
    end
end
