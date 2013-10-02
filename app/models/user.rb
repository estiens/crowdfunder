class User < ActiveRecord::Base
  authenticates_with_sorcery!
  # attr_accessible :title, :body
  attr_accessible :first_name, :last_name, :email, :password, :password_confirmation
  has_many :projects
  has_many :pledges

  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true
  validates_confirmation_of :password, :message => "should match confirmation", :if => :password

  def name
    "#{first_name} #{last_name}"
  end

end

