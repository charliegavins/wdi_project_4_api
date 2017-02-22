class Transaction < ApplicationRecord
  belongs_to :user, optional: true
  before_create :get_address_then_generate_gr_url

  after_update_commit do
    ActionCable.server.broadcast "transactions_channel_#{self.id}", payment_status: self.payment_status
  end

  private

    def get_address_then_generate_gr_url
      # response = Unirest.get "https://block.io/api/v2/get_new_address/?api_key=37be-fd8d-5632-ee22"
      #
      # # puts response.body
      # if response.body["data"]["address"]
      #   self.wallet_address = response.body["data"]["address"]
      # end

      self.wallet_address = "2N3JwUCfwZcADNJjjQ6hPrMTTzSEAvHNqke"
      generate_qr_url
    end

    def generate_qr_url
      self.qr_image_url = "https://chart.googleapis.com/chart?chs=300x300&chld=L|2&cht=qr&chl=bitcoin:#{self.wallet_address}?amount=#{self.amount}%26label=tipjar.com%26message=#{self.message}"
    end
end
