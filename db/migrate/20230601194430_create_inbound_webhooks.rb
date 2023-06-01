class CreateInboundWebhooks < ActiveRecord::Migration[7.0]
  def change
    create_table :inbound_webhooks, id: :uuid do |t|
      t.string :status, default: :pending
      t.text :body

      t.timestamps
    end
  end
end
