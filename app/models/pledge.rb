class Pledge < ActiveRecord::Base
  attr_accessible :amount, :project, :user_id
  belongs_to :user
  belongs_to :project

  validates :amount, :project_id, :user_id, presence: true
  validates_numericality_of :amount, :only_integer => true,  :greater_than => 0
end
