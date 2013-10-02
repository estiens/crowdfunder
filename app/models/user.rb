class User < ActiveRecord::Base
  authenticates_with_sorcery!
  # attr_accessible :title, :body
  attr_accessible :first_name, :last_name, :email, :password, :password_confirmation
  has_many :projects
  has_many :pledges

  validates :first_name, :last_name, :email, presence: true
  validates_confirmation_of :password, :message => "should match confirmation", :if => :password

  # validates :email, uniqueness: true
end
