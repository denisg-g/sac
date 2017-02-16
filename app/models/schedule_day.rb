class ScheduleDay < ActiveRecord::Base
  belongs_to :subject
  has_many :schedule_blocks,:dependent=> :destroy
  accepts_nested_attributes_for :schedule_blocks
end
