class TransactionSerializer < ActiveModel::Serializer
  attributes :id, :message, :amount, :payment_status, :recipient_url, :recipient_name, :recipient_img, :wallet_address
  has_one :user
end
