class User < ApplicationRecord
    before_save { self.email.downcase! }
    validates :name, presence: true, length: { maximum: 50 }
    validates :email, presence: true, length: { maximum: 255 },
                      format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                      uniqueness: { case_sensitive: false }
    has_secure_password
    
    has_many :books
    
    has_many :favorites
    has_many :favoring, through: :favorites, source: :book



    def favor(book)
        self.favorites.find_or_create_by(book_id: book.id)
    end
      
    def dissolve(book)
       favorite = self.favorites.find_by(book_id: book.id)
       favorite.destroy if favorite
    end
    
    def favoring?(book)
       self.favoring.include?(book)
    end
    
end


