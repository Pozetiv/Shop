class User < ApplicationRecord
  before_create :rules_admin
  before_create :generate_authentication_token!
  has_many :orders
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable,  :validatable

  validates :username, presence: true
  validates :auth_token, uniqueness: true

  private

  def rules_admin
    self.admin=User.count==0
  end

  def generate_authentication_token!
    begin
      self.auth_token = Devise.friendly_token
    end while self.class.exists?(auth_token: auth_token)
  end

end
