class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      t.text :message
      t.integer :amount
      t.string :payment_status
      t.string :recipient_url
      t.string :recipient_name
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
