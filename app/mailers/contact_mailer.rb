class ContactMailer < ApplicationMailer

  def contact_email(contact)
    @contact = contact
    mail to: ENV['MAIL'], subject: 'お問い合わせ内容'
  end
end
