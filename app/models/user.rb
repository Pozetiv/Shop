class User < ApplicationRecord
  has_secure_password
  before_save {self.email = email.downcase}

  validates :name, presence: true, length: {in: 3..16}
  validates :email, presence: true, length: {maximum: 255}, uniqueness: { case_sensitive: false}
  validates :password, presence: true, length: {in: 4..16}


end
