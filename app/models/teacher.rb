class Teacher < ActiveRecord::Base
  belongs_to :group
  has_many :tel_teachers, dependent: :destroy
  accepts_nested_attributes_for :tel_teachers, allow_destroy: true
  def complete_name
    "#{name} #{lastname}"
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
