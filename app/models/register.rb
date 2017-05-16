class Register < ActiveRecord::Base
  belongs_to :student
  has_many :documents
  accepts_nested_attributes_for :student
  accepts_nested_attributes_for :documents
  def self.search(search)
    if search.present?
      where('lower(year) LIKE ?', "%#{search}%")
    else
      all
    end
  end
end
