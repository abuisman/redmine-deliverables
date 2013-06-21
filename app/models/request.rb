class Request < ActiveRecord::Base
  unloadable

  belongs_to :deliverable

  belongs_to :project
  belongs_to :author, :class_name => "User"

  has_many :hand_ins, :order => 'created_at DESC'

end
