class Book < ApplicationRecord
    
    validates :title, presence: true, length: { maximum: 255 }
    validates :library, length: { maximum: 255 }
    validates :memo, length: { maximum: 255 }
    
    validates :status, inclusion: { in: [true, false] }
    
    mount_uploader :image, ImageUploader
    
    
    belongs_to :user

    has_many :reverses_of_favorite, class_name: 'Favorite', dependent: :destroy
    has_many :favored, through: :reverses_of_favorite, source: :user
end
