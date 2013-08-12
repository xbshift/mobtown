Rails.configuration.stripe = {
  :publishable_key => ENV['stripe_pk'],
  :secret_key      => ENV['stripe_sk']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
