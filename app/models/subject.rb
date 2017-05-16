class Subject < ActiveRecord::Base
  belongs_to :group
  has_and_belongs_to_many :students
  has_many :schedule_days, dependent: :destroy
  accepts_nested_attributes_for :schedule_days
  has_many :notes, dependent: :destroy
end
