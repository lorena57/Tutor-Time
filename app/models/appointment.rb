class Appointment < ApplicationRecord

    scope :desc_order, ->  { order(appointment_time: :desc) }
    
    belongs_to :tutor
    belongs_to :student

    validates :student_id, presence: true
    validates :appointment_time, presence: true

end
