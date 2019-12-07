class User < ActiveRecord::Base

  has_secure_password
  has_many :contacts
  has_many :notes, through: :contacts

  validates :first_name, presence: true
  validates :first_name, length: { minimum: 2 }
  validates :first_name, format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" }

  validates :last_name, presence: true
  validates :last_name, length: { minimum: 2 }
  validates :last_name, format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" }

  validates :email, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  validates :password, presence: true
  validates :password, length: { in: 3..20 }


end
