class Admin::LoginController < Admin::ApplicationController
  skip_before_action :authorize 

  layout 'login'
  def index; end

  def confirm_login
    administrator = Admin::Administrator.find_by(email: params[:email])
    if administrator.present? && administrator.authenticate(params[:password])
      session[:administrator] = administrator.id
      redirect_to admin_root_path, notice: "Successfully logged in"
    else
      flash[:error] = 'Invalid email or password'
      redirect_to admin_login_path
    end
  end

  def signup
    @administrator = Admin::Administrator.new
  end

  def create
    @administrator = Admin::Administrator.new(administrator_params)

    if @administrator.save
      redirect_to admin_login_path
    else
      render :signup # usando o render e uma action, ele apenas renderiza chama aquela action, e então o que eu tenho na minha action e view atual não serão perdidos(como erros no objeto cliente, por exemplo)
    end
  end

  def logout
    session[:administrator] = nil
    redirect_to admin_login_path, notice: 'Logged out successfully.'
  end

  private
    def administrator_params
      params.require(:admin_administrator).permit(:nome, :cpf, :telefone, :email, :password)
    end
end
