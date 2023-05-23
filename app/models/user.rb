class User < ApplicationRecord
    before_save {self.email = email.downcase}
    validates :username, presence: true,  uniqueness: {case_sensitive: false},length: {minimum:3,maximum:25}
    EMAIL_VALIDATION_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true, uniqueness: {case_sensitive: false}, length: {maximum:35}, format: {with: EMAIL_VALIDATION_REGEX}
    has_many :articles

    has_secure_password
end