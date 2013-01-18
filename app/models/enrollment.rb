class Enrollment < ActiveRecord::Base
  attr_accessible :user_id, :event_id
  belongs_to :user, :class_name => "User"
  belongs_to :event, :class_name => "Event"
  
  validates_uniqueness_of :user_id, :scope => [:event_id]
end
