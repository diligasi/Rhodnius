class Camera < ActiveRecord::Base
  validates_presence_of :camera_user, :description, :host, :name, :port
  validates :port, :name, :uniqueness => true
end
