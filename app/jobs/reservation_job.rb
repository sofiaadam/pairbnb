class ReservationJob < ApplicationJob
  queue_as :default

  def perform(x, y, z)
    ReservationMailer.booking_email(x, y, "#{z}").deliver_now
    # Do something later
  end
end

