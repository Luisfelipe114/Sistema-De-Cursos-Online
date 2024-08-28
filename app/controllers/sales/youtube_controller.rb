class Sales::YoutubeController < Sales::ApplicationController
  # skip_before_action :authorize
  include Sales::YoutubeHelper

  def redirect 
  end

  def upload
    path = params[:video].path
    debugger
    response = uploadVideo(path: path, title: params[:title], token: params[:token])
    render json: {embed: response }, status: :ok
  end
end
