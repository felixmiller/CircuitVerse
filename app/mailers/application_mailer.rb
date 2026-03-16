# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: "CircuitVerse <noreply@#{ENV.fetch('CALLBACK_ADDRESS', 'circuitverse.org').sub(%r{\Ahttps?://}, '')}>"
  layout "mailer"
end
