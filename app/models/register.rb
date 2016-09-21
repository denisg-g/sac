class Register < ActiveRecord::Base
  belongs_to :student
  accepts_nested_attributes_for :student
end
