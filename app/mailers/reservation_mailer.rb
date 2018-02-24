class ReservationMailer < ApplicationMailer
  def send_email_to_guest(guest, gym)
    @recipient = guest
    @gym = gym
    mail(to: @recipient.email, subject: "Enjoy Your Workout 💪🏽")
  end
end