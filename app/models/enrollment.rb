class Enrollment < ActiveRecord::Base
  attr_accessible :event_id, :student_id
  belongs_to :user, :class_name => "User"
  belongs_to :event, :class_name => "Event"
end
