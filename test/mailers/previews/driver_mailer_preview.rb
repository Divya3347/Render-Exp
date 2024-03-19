# Preview all emails at http://localhost:3000/rails/mailers/driver_mailer
class DriverMailerPreview < ActionMailer::Preview
  def welcome_email
    DriverMailer.with(driver: Driver.last).welcome_email
  end
end
