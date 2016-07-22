class Course < ActiveRecord::Base
    belongs_to :user
    has_many :chapters
    has_many :enrolls
    
    validates :title, presence: true, length: {maximum: 64}
    validates :description, presence: true
    validates :user_id, presence: true #created by
    
   def available_for(user)
    enrolls.find_by(user_id: user.id)
   end
end
