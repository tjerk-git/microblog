class Post < ApplicationRecord
    has_many :hearts, dependent: :delete_all
    has_many_attached :photos
    scope :desc, -> {
      order("posts.updated_at DESC")
    }
    validates :photos, blob: { content_type: ['image/png', 'image/jpg', 'image/jpeg'], size_range: 1..(5.megabytes) }
    validates :title, presence: true, uniqueness: true
    before_validation :create_slug

    def create_slug
        if slug.blank? && title.present?
          self.slug = title_to_slug
        end
      end
    
    def title_to_slug
    "#{title.to_s.downcase.parameterize.tr('_', '')}"
    end

end
