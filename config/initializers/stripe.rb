# frozen_string_literal: true

Stripe.api_key = Rails.application.credentials[:stripe][:stripe_secret_key]
