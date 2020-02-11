class Student < ApplicationRecord

    has_many :appointments
    has_many :tutors, through: :appointments

end
