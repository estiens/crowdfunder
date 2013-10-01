class User < ActiveRecord::Base
  authenticates_with_sorcery!
  # attr_accessible :title, :body
  attr_accessible :first_name, :last_name, :email, :password, :password_confirmation
  validates_confirmation_of :password
  has_many :projects
end
