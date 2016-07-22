class ChaptersController < ApplicationController
  before_action :set_chapter, only: [:show, :edit, :update, :destroy]
  before_action :set_course
  before_action :set_breadcrumbs
  before_action :authenticate_user!

  # GET /chapters
  # GET /chapters.json
  def index
    @chapters = @course.chapters
    @enroll = current_user.enrolls.find_by(course_id: @course.id)
    @enroll_chapter = @enroll.chapter_level + 1
    # authorize! :read, @chapters
  end

  # GET /chapters/1
  # GET /chapters/1.json
  def show
  end

  # GET /chapters/new
  def new
    @chapter = Chapter.new
    @path = [@course, @chapter]
  end

  # GET /chapters/1/edit
  def edit
    @path = @chapter
  end

  # POST /chapters
  # POST /chapters.json
  def create
    @chapter = @course.chapters.new(chapter_params)

    respond_to do |format|
      if @chapter.save
        format.html { redirect_to @chapter, notice: 'Chapter was successfully created.' }
        format.json { render :show, status: :created, location: @chapter }
      else
        format.html { render :new }
        format.json { render json: @chapter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chapters/1
  # PATCH/PUT /chapters/1.json
  def update
    respond_to do |format|
      if @chapter.update(chapter_params)
        format.html { redirect_to @chapter, notice: 'Chapter was successfully updated.' }
        format.json { render :show, status: :ok, location: @chapter }
      else
        format.html { render :edit }
        format.json { render json: @chapter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chapters/1
  # DELETE /chapters/1.json
  def destroy
    @chapter.destroy
    respond_to do |format|
      format.html { redirect_to chapters_url, notice: 'Chapter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chapter
      @chapter = Chapter.find(params[:id])
    end
    def set_course
      if params[:course_id]
        @course = Course.find(params[:course_id])
      else
        @course = @chapter.course
      end
    end
    
    def set_breadcrumbs
      add_breadcrumb "Главная", user_root_path
      add_breadcrumb @course.title, course_path(@course)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chapter_params
      params.require(:chapter).permit(:title, :content)
    end
end
