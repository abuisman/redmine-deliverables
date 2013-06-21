class Deliverable < ActiveRecord::Base
  unloadable

  scope :active, where(:archived => false)
  scope :archived, where(:archived => true)

  belongs_to :user, :foreign_key => "author_id"

  has_many :hand_ins, :through => :requests
  has_many :requests

  accepts_nested_attributes_for :requests

  validates_presence_of :name
  validates_presence_of :user

  def completed_request_count
    count = 0
    requests.each do |req|
      if req.hand_ins.any?
        count = count + 1
      end
    end

    return count
  end

  def archive
    self.archived = true
    save
  end

  def activate
    self.archived = false
    save
  end

end
