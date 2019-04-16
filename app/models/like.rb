class Like < ApplicationRecord
    # validates user_id: presence, uniqueness in combination with photo
    validates :user_id, presence: true, uniqueness: {
        scope: :photo_id,
        message: "one like per user per photo"
    }
    
    # validates photo_id: presence
    validates :photo_id, presence: true
    
    #set up one to many associations
    belongs_to :user, :class_name => "User", :foreign_key => "user_id"
    
    belongs_to :photo, :class_name => "Photo", :foreign_key => "photo_id"
    
    #many to many -- user can have many liked_photos, liked_photos is the method, walk through likes table, finds collection of photos, and returns it
    #has_many :liked_photos, :through => :likes, :source => :photo
    
    
end
