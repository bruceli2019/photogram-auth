class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  # valiadates username for presence and uniqueness 
  validates :username, presence: true, uniqueness: true

  #make sure associated photos, likes, comments get destroyed when user gets destroyed
  has_many :photos, :dependent => :destroy
  has_many :likes, :dependent => :destroy  
  has_many :comments, :dependent => :destroy
         
end
