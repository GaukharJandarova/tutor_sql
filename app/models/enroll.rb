class Enroll < ActiveRecord::Base
    belongs_to :user
    belongs_to :course
    belongs_to :chapters
    validates_uniqueness_of :user_id, scope: :course_id
end
