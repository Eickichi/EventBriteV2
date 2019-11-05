class Attendance < ApplicationRecord
  after_create :event_send 

def event_send
    EventMailer.event_email(self).deliver_now
end

  belongs_to :user
  belongs_to :event
end
