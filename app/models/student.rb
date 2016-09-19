class Student < ActiveRecord::Base
	has_and_belongs_to_many :tutors
	has_many :registers, :dependent => :destroy
	accepts_nested_attributes_for :tutors
end
