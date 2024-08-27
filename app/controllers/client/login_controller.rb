class Client::LoginController < ApplicationController
  # skip_before_action :authorize

  layout 'login'
  def index; end

  def confirm_login
    user = Client::User.find_by(email: params[:email])
    if user.present? && user.authenticate(params[:password])
      session[:user] = user.id
      redirect_to client_root_path, notice: "Successfully logged in"
    else
      flash[:error] = 'Invalid email or password'
      redirect_to client_root_path
    end
  end

  def signup
    @user = Client::User.new
  end

  def create
    @user = Client::User.new(user_params)

    if @user.save
      redirect_to client_login_path,  notice: 'Cadastro realizado com sucesso'
    else
      render :signup # usando o render e uma action, ele apenas renderiza chama aquela action, e então o que eu tenho na minha action e view atual não serão perdidos(como erros no objeto cliente, por exemplo)
    end
  end

  def logout
    session[:user] = nil
    redirect_to client_login_path, notice: 'Logged out successfully.'
  end

  private
    def user_params
      params.require(:client_user).permit(:nome, :cpf, :telefone, :email, :password)
    end
end
