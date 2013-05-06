Rails.configuration.stripe = {
  :publishable_key => 'pk_test_nnc5HQffmhuLStHeUaKOEtZG',
  :secret_key      => 'sk_test_gDpoQikOIA2fz5ZICjXlYZbo'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
