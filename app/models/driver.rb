class Driver < ApplicationRecord
  # before_create :brf_crt
  # after_create -> { puts "Congratulations! Car Owner is Succesfully Created" }
  # after_create_commit -> { puts "These from create commit" }

  # before_update -> { puts "You are before to edit" }
  # around_update :around_update
  # after_update -> { puts "You are after the edit" }
  # after_update_commit -> { puts "These from update commit" }

  # before_destroy -> { puts "You want to destroy car owner" }
  # around_destroy :around_call
  # after_destroy -> { puts "You just delete car owner, Thank You" }
  # after_destroy_commit -> { puts "These from delete commit" }

  # after_save_commit -> { puts "These is from save commit" }
  # after_rollback -> { puts "These is from rollback commit" }

  # after_touch -> { puts "You touch an object" }
  # after_touch :touch_field

  # after_create DriverCallback.new
  # before_create DriverCallback.new

  # private
  # def touch_field
  #   puts "You touch using method"
  # end

  # def around_call
  #   yield
  #   puts "Around destroy works here"
  # end

  # def around_update
  #   yield
  #   puts "Around update works here"
  # end

  # def brf_crt
  #   puts "You want to create car owner"
  # end
  acts_as_paranoid

  before_destroy :delete_mail

  private
  def delete_mail
    DriverMailer.destroy_email(self).deliver_now
  end

  # after_create :send_all

  # private
  # def send_all
  #   @drivers = Driver.all
  #   @drivers.each do |driver|
  #     DriverMailer.with(driver: driver).welcome_email.deliver_later
  #   end
  # end

  paginates_per 5

  def self.ransackable_attributes(_auth_object)
    ["name","age","gender","marry","car","color","cnum","email"]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end

  require 'csv'
  def self.to_csv
    posts = all
    CSV.generate do |csv|
      csv << column_names
      posts.each do |post|
        csv << post.attributes.values_at(*column_names)
      end
    end
  end
end
