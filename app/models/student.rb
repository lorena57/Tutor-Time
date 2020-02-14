class Student < ApplicationRecord

    before_save {self.email = email.downcase}

    validates :username, presence: true, length: { maximum: 20 }, uniqueness: true
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 20 },
                    format: { with: VALID_EMAIL_REGEX }, 
                    uniqueness: { case_sensitive: false}

    has_many :appointments
    has_many :tutors, through: :appointments

    has_secure_password

end
