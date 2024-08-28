module Sales::YoutubeHelper  
  def uploadVideo(path:, title:, token:)
    Yt.configuration.client_id = ENV['OAUTH_CLIENT_ID']
    Yt.configuration.client_secret = ENV['OAUTH_SECRET_KEY']

    account = Yt::Models::Account.new access_token: token 

    account.upload_video path, title: title # pra dar certo o envio, tem que criar um canal lá no youtube Studio, caso contrário ele vai dar unauthorized

    Yt.configure do |config| # isso aqui é só pra log
      config.log_level = :debug
    end
  end
end
