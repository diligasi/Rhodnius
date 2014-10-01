class Camera < ActiveRecord::Base
  has_many :comment

  validates_presence_of :description, :name
  validates :name, :uniqueness => true
  self.inheritance_column = nil
end
