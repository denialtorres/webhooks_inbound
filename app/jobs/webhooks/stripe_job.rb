class Webhooks::StripeJob < ApplicationJob
  queue_as :default

  def perform(inbound_webhook)
    json = JSON.parse(inbound_webhook.body, symbolize_names: true)
    event = Stripe::Event.contruct_from(json)

    case event.type
    when "customer.updated"
      # Find customer and update their details
      inbound_webhook.update!(status: :processed)
    else
      inbound_webhook.update!(status: :skipped)
    end
  end
end
