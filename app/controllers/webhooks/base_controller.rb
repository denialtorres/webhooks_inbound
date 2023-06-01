class Webhooks::BaseController < ApplicationController
  # Disable CSRF checks on webhooks because they do not originate from the browser
  # skip_before_action :verify_authenticy_token
  skip_forgery_protection

  def create
    head :ok
  end
end
