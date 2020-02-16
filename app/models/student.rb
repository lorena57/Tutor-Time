class Student < ApplicationRecord

    before_save {self.email = email.downcase}

    validates :username, presence: true, length: { maximum: 20 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 50 },
                    format: { with: VALID_EMAIL_REGEX }, 
                    uniqueness: true

    validates :username, presence: true
    validates :email, presence: true                

    has_many :appointments
    has_many :tutors, through: :appointments

    has_secure_password
    validates :password, presence: true, length: { minimum: 5 }, allow_blank: true


end
