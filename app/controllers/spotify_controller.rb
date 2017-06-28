class SpotifyController < ApplicationController
  skip_before_action :authenticate_user!

  # def initialize
  #   get_token
  # end

  def get_token
    response = Unirest.post "https://accounts.spotify.com/api/token",
    headers:{ "Authorization" => "Basic YTM1NjRjNzBkY2M3NDFhOWEyNjYxNDU0MDg3ZmU2OGE6MTU3MmE0ZTdkM2Q4NDgzN2I1ODMxODE0MzVhZTIzMTY=", "Content-Type" => "application/x-www-form-urlencoded"},
    parameters:{ "grant_type" => "client_credentials"}
    $token = response.body["access_token"]
    puts $token
  end

  def search
    response = Unirest.get "https://api.spotify.com/v1/search?q=#{params["search"]}&type=artist", headers:{ "Authorization" => "Bearer #{$token}"}
    puts response.body
    render json: { response: response, status: 200 }
  end

  # if response.body["data"]["address"]
  #   wallet_address = response.body["data"]["address"]
  #   render json: { response: wallet_address}
  # else
  #   render json: { response: "oops the get request to API didn't work"}
  # end

end
