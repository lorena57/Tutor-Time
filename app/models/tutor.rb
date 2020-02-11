class Tutor < ApplicationRecord

    has_many :appointments
    has_many :students, through: :appointments

end
