class User < ApplicationRecord
  before_create :rules_admin
  has_many :orders
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable,  :validatable

  private

  def rules_admin
    self.admin=User.count==0
  end

end
