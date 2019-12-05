class User < ActiveRecord::Base

  has_secure_password
  has_many :contacts
  has_many :notes, through: :contacts

end
