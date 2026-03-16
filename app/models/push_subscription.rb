# frozen_string_literal: true

class PushSubscription < ApplicationRecord
  belongs_to :user

  def send_push_notification(message, url = "")
    payload = {
      body: message,
      url: url
    }
    Webpush.payload_send(
      message: JSON.generate(payload),
      endpoint: self[:endpoint],
      p256dh: self[:p256dh],
      auth: self[:auth],
      vapid: {
        subject: "mailto:noreply@#{ENV.fetch('CALLBACK_ADDRESS', 'circuitverse.org').sub(%r{\Ahttps?://}, '')}",
        public_key: Rails.application.config.vapid_public_key,
        private_key: Rails.application.config.vapid_private_key
      }
    )
  end
end
