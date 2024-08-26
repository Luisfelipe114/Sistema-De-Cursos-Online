class Sales::LoginController < Sales::ApplicationController
  skip_before_action :authorize

  layout 'login'
  def index; end

  def confirm_login
    seller = Sales::Seller.find_by(email: params[:email])
    if seller.present? && seller.authenticate(params[:password])
      session[:seller] = seller.id
      redirect_to sales_root_path, notice: "Successfully logged in"
    else
      flash[:error] = 'Invalid email or password'
      redirect_to sales_login_path
    end
  end

  def signup
    @seller = Sales::Seller.new
  end

  def create
    @seller = Sales::Seller.new(seller_params)

    if @seller.save
      redirect_to sales_login_path
    else
      render :signup # usando o render e uma action, ele apenas renderiza chama aquela action, e então o que eu tenho na minha action e view atual não serão perdidos(como erros no objeto cliente, por exemplo)
    end
  end

  def logout
    session[:seller] = nil
    redirect_to sales_login_path, notice: 'Logged out successfully.'
  end

  private
    def seller_params
      params.require(:sales_seller).permit(:nome, :cpf, :telefone, :email, :password)
    end
end
