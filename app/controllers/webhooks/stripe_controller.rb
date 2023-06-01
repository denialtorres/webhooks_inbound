class Webhooks::StripeController < Webhooks::BaseController
  def create
    record = InboundWebhook.create!(body: payload)

    Webhooks::StripeJob.perform_later(record)
    head :ok
  end
end
