class Transaction < ApplicationRecord
  belongs_to :user, optional: true
  before_save :get_address
  before_save :generate_qr_url

  private

    def get_address
      response = Unirest.get "https://block.io/api/v2/get_new_address/?api_key=37be-fd8d-5632-ee22"

      # puts response.body
      if response.body["data"]["address"]
        self.wallet_address = response.body["data"]["address"]
      end
    end

    def generate_qr_url
      self.qr_image_url = "https://chart.googleapis.com/chart?chs=300x300&chld=L|2&cht=qr&chl=bitcoin:#{self.wallet_address}?amount=#{self.amount}%26label=tipjar.com%26message=#{self.message}"
    end
end
