class Camera < ActiveRecord::Base
  has_many :comment

  validates_presence_of :camera_user, :description, :host, :name, :port
  validates :port, :name, :uniqueness => true
end
