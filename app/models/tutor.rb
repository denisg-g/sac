class Tutor < ActiveRecord::Base
	has_many :tel_tutors, :dependent => :destroy
	has_and_belongs_to_many :students
	accepts_nested_attributes_for :tel_tutors,:allow_destroy => true
	def self.search(search)
	  if search
	    where('lower(first) LIKE ? or lower(second) LIKE ?',"%#{search}%","%#{search}%")
	  else
	    all
 	  end
	end
	before_destroy :usr_delete
	def usr_delete
    	@tel_tutors
  	end

end
