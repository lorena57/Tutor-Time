class Appointment < ApplicationRecord

    scope :soonest_app, -> {order('created_at DESC')}
    
    belongs_to :tutor
    belongs_to :student

    validates :student_id, presence: true
    validates :appointment_time, presence: true

end
