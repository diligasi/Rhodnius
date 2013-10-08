class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :camera

  validates_presence_of :comment
end
