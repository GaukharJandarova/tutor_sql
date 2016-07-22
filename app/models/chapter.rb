class Chapter < ActiveRecord::Base
    belongs_to :course
    has_many :challenges
    has_many :enrolls
    
    validates :title, presence: true
    validates :content, presence: true
end
