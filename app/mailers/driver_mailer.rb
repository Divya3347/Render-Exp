class DriverMailer < ApplicationMailer
  default from: 'carregister@email.com'

  def welcome_email
    @driver = params[:driver]
    @link = "https://www.google.com"
    mail(to: @driver.email , subject: "Car Registeration done succesfully", cc: 'cc@example.com ', bcc: 'bcc@example.com').attachments.inline['bugga.jpeg'] = File.read('app/assets/images/bugga.jpeg')
  end

  def update_email
    @driver = params[:driver]
    mail(to: @driver.email, subject: "Car Deatils Update succesfully").attachments.inline['bugga.jpeg'] = File.read('app/assets/images/bugga.jpeg')
  end

  def destroy_email(driver)
    @driver = driver
    mail(to: @driver.email , subject:"Warning , your details is delete")
  end
end
