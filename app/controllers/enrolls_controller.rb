class EnrollsController < ApplicationController
 
 def create 
  @enroll = current_user.enrolls.new(course_id: params[:course_id])
  @enroll.status = "new"
  @enroll.chapter_level = 0
  @enroll.save
  redirect_to course_path(@enroll.course_id)
 end
 
 def update 
  @enroll = current_user.enrolls.find(params[:id])
  @enroll.status = "in process"
  @enroll.chapter_level = params[:id] #@enroll.chapter_level + 1
  respond_to do |format|
      if @enroll.save
        format.html { redirect_to chapter_challenges_path(params[:id]), notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
 end
 
end
