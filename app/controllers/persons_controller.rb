class PersonsController < ApplicationController
  def profile
    @enrolls = current_user.enrolls
    @allcourses = Course.all
  end
end
