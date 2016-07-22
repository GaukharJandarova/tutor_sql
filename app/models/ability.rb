class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new 
    can :read, Chapter do |chapter|
     enroll_of(chapter.course_id)
    end
    # if user.admin_flag?
    #   # can :manage, :all
    # else
      
    # end
    
  end
end
