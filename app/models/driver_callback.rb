class DriverCallback
  def after_create(driver)
    puts "Executing after_create callback for driver #{driver.name}"
  end

  def before_create(driver)
    puts "Executing before_create callback for driver #{driver.name}"
  end
end
