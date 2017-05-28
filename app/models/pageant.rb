class Pageant < ApplicationRecord
    mount_uploader :image, ImageUploader
    validates :name, presence: true, length: { minimum: 5, maximum: 30 }
    validates :description, presence: true, length: { minimum: 10, maximum: 150 }
    validates :category, presence: true, length: { minimum: 5, maximum: 20 }
    
    #validates_inclusion_of :time_zone, in: ActiveSupport::TimeZone.all(&:to_s)
    
    
    default_scope -> {order(updated_at: :desc)}
    belongs_to :user, optional: true
    has_many :contestants, dependent: :destroy
    
end
