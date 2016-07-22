class ChallengesController < ApplicationController
  before_action :set_challenge, only: [:show, :edit, :update, :destroy]
  before_action :set_chapter
  before_action :set_breadcrumbs
  before_action :authenticate_user!

  # GET /challenges
  # GET /challenges.json
  def index
    @challenges = @chapter.challenges
  end

  # GET /challenges/1
  # GET /challenges/1.json
  def show
    @answer = current_user.answer_for(@challenge) || Answer.new
  end

  # GET /challenges/new
  def new
    @challenge = Challenge.new
    @path = [@chapter, @challenge]
  end

  # GET /challenges/1/edit
  def edit
     @path = @challenge
  end

  # POST /challenges
  # POST /challenges.json
  def create
    
    @challenge = @chapter.challenges.new(challenge_params)

    respond_to do |format|
      if @challenge.save
        format.html { redirect_to :back, notice: 'Challenge was successfully created.' }
        format.json { render :show, status: :created, location: @challenge }
      else
        format.html { render :new }
        format.json { render json: @challenge.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /challenges/1
  # PATCH/PUT /challenges/1.json
  def update
    respond_to do |format|
      if @challenge.update(challenge_params)
        format.html { redirect_to @challenge, notice: 'Challenge was successfully updated.' }
        format.json { render :show, status: :ok, location: @challenge }
      else
        format.html { render :edit }
        format.json { render json: @challenge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /challenges/1
  # DELETE /challenges/1.json
  def destroy
    @challende.destroy
    respond_to do |format|
      format.html { redirect_to challenges_url, notice: 'Challenge was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_challenge
      @challenge = Challenge.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def challenge_params
      params.require(:challenge).permit(:title, :content, :correct_result, :challenge_level)
    end
    
    def set_chapter
      if params[:chapter_id]
        @chapter = Chapter.find(params[:chapter_id])
      else
        @chapter = @challenge.chapter
      end
    end
    
    def set_breadcrumbs
      add_breadcrumb "Главная", user_root_path
      add_breadcrumb @chapter.course.title, course_path(@chapter.course)
      add_breadcrumb @chapter.title, chapter_path(@chapter)
    end
    
end
