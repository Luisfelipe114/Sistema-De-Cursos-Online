class Sales::YoutubeController < Sales::ApplicationController
  # skip_before_action :authorize
  include Sales::YoutubeHelper

  def redirect 
  end

  def upload
    begin
      path = params[:video].path
      response = uploadVideo(path: path, title: params[:title], token: params[:token])
      debugger
      
      render json: { embed: response.embed_html }, status: :ok
      return
    rescue StandardError => e
      puts e
      flash[:error] = 'Ocorreu um erro ao fazer o upload do vídeo. Por favor, tente novamente.'
    end
  end
end
