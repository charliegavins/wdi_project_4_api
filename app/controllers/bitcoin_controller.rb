class BitcoinController < ApplicationController
  skip_before_action :authenticate_user!



  def generate_address
    response = Unirest.get "https://block.io/api/v2/get_new_address/?api_key=37be-fd8d-5632-ee22"

    if response.body["data"]["address"]
      wallet_address = response.body["data"]["address"]
      render json: { response: wallet_address}
    else
      render json: { response: "oops the get request to API didn't work"}
    end
  end
end
