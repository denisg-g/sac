class Note < ActiveRecord::Base
  belongs_to :subject
  belongs_to :student
  has_many :evaluations,:dependent => :destroy
end
