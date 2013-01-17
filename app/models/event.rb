class Event < ActiveRecord::Base
  attr_accessible :date, :duration, :max_users, :min_users, :time, :title
  has_many :users, :class_name => "User"
end
