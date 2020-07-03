class TestMailer < ActionMailer::Base
  default from: "Admin <admin@pcbKart.com>"
  layout 'mailer'
  def test_send(email, orderId)
    @email = email
    mail(to: @email, subject: 'Order ' + orderId + " has been successfully created")
  end
end