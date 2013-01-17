class Event < ActiveRecord::Base
  attr_accessible :date, :duration, :max_users, :min_users, :time, :title
end
