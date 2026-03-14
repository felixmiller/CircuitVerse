# frozen_string_literal: true

class IssueMailer < ApplicationMailer
  def report(text:, circuit_data_url:, reporter:)
    @text = text
    @circuit_data_url = circuit_data_url
    @reporter = reporter
    mail(
      to: ENV.fetch("ISSUE_REPORT_EMAIL", "noreply@circuitverse.ee.hm.edu"),
      subject: "CircuitVerse Issue Report"
    )
  end
end
