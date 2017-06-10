class Teacher < ActiveRecord::Base
  belongs_to :group
  has_many :tel_teachers, dependent: :destroy
  accepts_nested_attributes_for :tel_teachers, allow_destroy: true
  require 'csv'

  def complete_name
    "#{name} #{lastname}"
 end


def self.to_csv_loan(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |teacher|
        csv << teacher.attributes
      end
    end
   end
  has_attached_file :image,
                    content_type: { content_type: 'image/jpg' },
                    default_url: 'missing.jpg'
  def self.search(search)
    if search.present?
      where('lower(name) LIKE ? or lower(turno) LIKE ?', "%#{search}.downcase%", "%#{search}.downcase%")
    else
      all
    end
  end
end
