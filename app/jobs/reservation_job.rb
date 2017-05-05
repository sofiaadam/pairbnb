class ReservationJob < ApplicationJob
  queue_as :default

  def perform(x, y, z)
    byebug
    ReservationMailer.booking_email(x, y, "#{z}").deliver_later
    # Do something later
  end
end

