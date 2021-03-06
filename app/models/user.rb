class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :username, presence: true
  
  has_many :courses
  has_many :enrolls, dependent: :destroy
  has_many :answers
  
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  
  def enroll_of(course)
    enrolls.find_by(course_id: course.id)
  end
  
  def answer_for(challenge)
    answers.find_by(challenge_id: challenge.id)
  end
end
