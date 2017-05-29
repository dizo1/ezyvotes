class Contestant < ApplicationRecord
    mount_uploader :image, ImageUploader
    validates_presence_of :image
    validates :con_num, presence: true
    validates :name, presence: true, length: { minimum: 5, maximum: 20 }
    validates :profile, presence: true, length: { minimum: 5, maximum: 40 }
    
    belongs_to :pageant, optional: true
    #belongs_to :user
end
