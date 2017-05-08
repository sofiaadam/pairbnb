class ReservationJob < ApplicationJob
  queue_as :default

  def perform(x, y, z)
   
    ReservationMailer.booking_email(customer, host, "#{reservation_id}").deliver_later
    # Do something later
  end
end

