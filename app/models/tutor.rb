class Tutor < ApplicationRecord

    has_many :appointments
    has_many :students, through: :appointments


    scope :search, -> (query) { where("SME LIKE ?", "%" + query + "%") }


end
