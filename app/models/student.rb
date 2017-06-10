class Student < ActiveRecord::Base
  has_and_belongs_to_many :tutors
  has_many :registers, dependent: :destroy
  has_many :notes, dependent: :destroy # nodepende
  has_and_belongs_to_many :subjects
  accepts_nested_attributes_for :tutors
  belongs_to :group
  require 'csv'


  def self.to_csv_loan(options = {})
      CSV.generate(options) do |csv|
        csv << column_names
        all.each do |student|
          csv << student.attributes
        end
      end
     end

  def self.search(search)
    if search.present?
      where('lower(nombre) LIKE ? or lower(nombre1) LIKE ? or lower(apellido) LIKE ? or lower(apellido1) LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
    else
      all
    end
  end
  has_attached_file :avatar
end
