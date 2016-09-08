class Tutor < ActiveRecord::Base
	has_many :tel_tutors, :dependent => :destroy
	has_and_belongs_to_many :students
	accepts_nested_attributes_for :tel_tutors,:allow_destroy => true
end
