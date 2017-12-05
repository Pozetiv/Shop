class User < ApplicationRecord
	before_save :find_admin
	has_many :orders

	before_save {self.email = email.downcase}
	
	has_secure_password

	#validates
	validates :name, presence: true, length: { minimum: 3}
	validates :email, presence: true, length: { maximum: 100}, uniqueness: { case_sensitive: false}
	validates :password, presence: true, length: { minimum: 4}, allow_nil: true

	def User.digest(string)
		cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
							 																		BCrypt::Engine.cost
		BCrypt::Password.create(string, cost: cost)
	end

	private

	def find_admin
		up = User.first
		up.update_attributes(admin: true)
	end
end
