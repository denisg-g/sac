class Group < ActiveRecord::Base
  has_many :students
  has_many :subjects, dependent: :destroy
  has_one :teacher
  def tname
    "#{name} #{seccion}"
 end

  def self.search(search)
    if search.present?
      where('lower(name) LIKE ? or lower(turno) LIKE ?', "%#{search}.downcase%", "%#{search}.downcase%")
    else
      all
    end
  end
end
