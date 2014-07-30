require 'bcrypt'

class User < ActiveRecord::Base
	has_many :derps
	validates :email, uniqueness: true

	# has_secure_password
	include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

end
