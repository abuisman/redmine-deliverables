class Rating < ActiveRecord::Base
  unloadable

  belongs_to :hand_in
  belongs_to :author, :class_name => "User"

end
