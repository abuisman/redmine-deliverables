class HandIn < ActiveRecord::Base
  unloadable
  
  acts_as_attachable

  belongs_to :request
  belongs_to :user, :foreign_key => :author_id

  has_one :project, :through => :request

  has_many :ratings

  def attachments_visible?(user)
    true
  end
end
