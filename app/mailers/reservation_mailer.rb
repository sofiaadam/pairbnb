class ReservationMailer < ApplicationMailer
    default from: "admin@waterbnb.com"
    # layout 'reservation_mailer'

    def booking_email(customer, host, reservation_id)
        @customer = customer
        @host = host
        @url = "/reservation/#{reservation_id}"
        
        mail(to: @host.email, subject: 'Someone booked a reservation')
    end
    

end



