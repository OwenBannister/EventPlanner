class Event < ActiveRecord::Base
  attr_accessible :date, :duration, :max_users, :min_users, :time, :title, :current_users, :image
  has_many :users, :class_name => "User"

  validates :title, presence: true,
    uniqueness: { case_sensitive: false }
end
