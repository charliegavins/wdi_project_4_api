class TransactionSerializer < ActiveModel::Serializer
  attributes :id, :message, :amount, :payment_status, :recipient_url, :recipient_name
  has_one :user
end
