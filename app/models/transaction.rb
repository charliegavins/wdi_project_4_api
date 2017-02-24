class Transaction < ApplicationRecord
  belongs_to :user, optional: true
  before_create :get_address_then_generate_gr_url

  after_update_commit do
    ActionCable.server.broadcast "transactions_channel_#{self.id}", payment_status: self.payment_status
  end

  private

    def get_address_then_generate_gr_url
      p 'ping'
      response = Unirest.get "https://block.io/api/v2/get_new_address/?api_key=6255-1e30-beec-4fac"

      # puts response.body
      if response.body["data"]["address"]
        self.wallet_address = response.body["data"]["address"]
      end

      # TESTNET
      # self.wallet_address = "2N3JwUCfwZcADNJjjQ6hPrMTTzSEAvHNqke"
      # BTC
      # self.wallet_address = "37tghpefdKSS7qj9tg3ydWVrciVyukYjZy"
      generate_qr_url
    end

    def generate_qr_url
      p 'ping'
      blibber = (self.amount.to_f)/100000000
      p blibber
      self.qr_image_url = "https://chart.googleapis.com/chart?chs=300x300&chld=L|2&cht=qr&chl=bitcoin:#{self.wallet_address}?amount=#{blibber}%26label=tipjar.com%26message=#{self.message}"
    end
end
