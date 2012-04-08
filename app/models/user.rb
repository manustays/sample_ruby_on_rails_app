# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class User < ActiveRecord::Base
	attr_accessible :email, :name, :password, :password_confirmation
	has_secure_password

	validates :name, presence: true, length: { maximum: 100 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 100 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
	validates :password, length: { minimum: 6, maximum: 50 }
	validates :password_confirmation, presence: true
end



####EXAMPLES
#validates :terms, :acceptance => true
#validates :password, :confirmation => true
#validates :username, :exclusion => { :in => %w(admin superuser) }
#validates :email, :format => { :with => %r\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/, :on => :create }
#validates :age, :inclusion => { :in => 0..9 }
#validates :first_name, :length => { :maximum => 30 }
#validates :age, :numericality => true
#validates :username, :presence => true
#validates :username, :uniqueness => true