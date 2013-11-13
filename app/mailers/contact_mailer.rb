class ContactMailer < ActionMailer::Base
  default to: "joey@fergmedia.com"

  layout 'email'
  def contact_us(message)
    @message = message
    mail(subject: "[Portfolio-Site] #{message.subject}", from: @message.email)
  end
end