class Photo < ApplicationRecord
    
    #validates photo for user_id presence
    validates :user_id, presence: true
    
      
    #set up one to many associations, user is the method, the table is User, the key being matched is user_id
    belongs_to :user, :class_name => "User", :foreign_key => "user_id"
    
    #set up many to many associations, user has many liked photos and comments
    has_many :liked_photos
    
    #many to many -- photos have many fans through likes, source is the user
    has_many :fans, :through => :likes, :source => :user
    
    #make sure that the associated likes, comments get destroyed with photos if photo is deleted
    has_many :likes, :dependent => :destroy
    has_many :comments, :dependent => :destroy
    
end
