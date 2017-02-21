class Transaction < ApplicationRecord
  belongs_to :user, optional: true
  before_save :get_address

  private

    def get_address
      response = Unirest.get "https://block.io/api/v2/get_new_address/?api_key=37be-fd8d-5632-ee22"

      # puts response.body
      if response.body["data"]["address"]
        self.wallet_address = response.body["data"]["address"]
      end
    end
end
