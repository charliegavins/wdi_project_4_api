class TransactionsChannel < ApplicationCable::Channel


  def subscribed
p "*********************************"
    stream_from stream_name
  end

  # This is a generic method
  def receive(data)
p "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    ActionCable.server.broadcast stream_name, data.fetch('message')
  end

  def pending_transaction_started(data)
    ActionCable.server.broadcast stream_name, data.fetch('message')
  end

  private

    def stream_name
      @transaction = Transaction.find(transaction_id)
      "transactions_channel_#{@transaction.id}"
    end

    def transaction_id
      params.fetch('data').fetch('id')
    end
end
