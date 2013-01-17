class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation, :phone_number
  has_secure_password
 has_many :event, :class_name => "Event"

  before_save { |user| user.email = email.downcase }
  validates :name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
    format: { with: VALID_EMAIL_REGEX },
    uniqueness: { case_sensitive: false }
  validates :password, presence: true
  validates :password_confirmation, presence: true
  VALID_NUMBER_REGEX = /\A[0-9]+\z/
  validates :phone_number, presence: true, format: { with: VALID_NUMBER_REGEX }



  
end
