class Patient < ApplicationRecord
  enum gender: %i[Male Female Other]

  has_many :results

  validates_presence_of :name, :nationality, :email, :phone_number, :ic_number, :gender, :birth_of_date
  validates :name, length: { within: 2..99 }
  validates :phone_number, length: { within: 8..14 }, format: { with: /\A\+\d+\Z/, message: 'invalid phone number' }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: 'invalid email address' }
  validates :ic_number, uniqueness: { case_sensitive: false }
end
