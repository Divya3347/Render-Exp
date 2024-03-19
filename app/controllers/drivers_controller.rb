require 'prawn'
class DriversController < ApplicationController
  def index
    @q = Driver.ransack(params[:q])
    @drivers = @q.result(distinct: true).page params[:page]
    respond_to do |format|
      format.html
      format.csv { send_data Driver.to_csv, filename: "driver.csv"}
    end
  end

  def show
    @driver = Driver.find(params[:id])
  end

  def new
    @driver = Driver.new
  end

  def create
    @driver = Driver.new(driver_params)
    if @driver.save
      DriverMailer.with(driver: @driver).welcome_email.deliver_later
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @driver = Driver.find(params[:id])
  end

  def update
    @driver = Driver.find(params[:id])
    if @driver.update(driver_params)
      DriverMailer.with(driver: @driver).update_email.deliver_later
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @driver = Driver.with_deleted.find(params[:id])
    if @driver.deleted_at.nil?
      @driver.destroy
    else
      @driver.destroy_fully!
    end

    redirect_to root_path
  end

  def download_pdf
    driver = Driver.find(params[:id])
    send_data generate_pdf(driver),
              filename:"#{driver.name}.pdf",
              type:"application/pdf"
  end

  def trash
    @driver = Driver.only_deleted
  end

  def restore
    @driver = Driver.only_deleted.find(params[:id])
    @driver.recover

    redirect_to root_path
  end

  private
  def driver_params
    params.require(:driver).permit(:name,:age,:gender,:marry,:car,:color,:email,:cnum,:name_cont)
  end

  def generate_pdf(driver)
    Prawn::Document.new do
      text "Name : #{driver.name}"
      text "Email : #{driver.email}"
      text "Age : #{driver.age}"
      text "Gender : #{driver.gender}"
      text "Married Status : #{driver.marry}"
      text "Car : #{driver.car}"
      text "Car Number : #{driver.cnum}"
      text "Car Color : #{driver.color}"
    end.render
  end
end
