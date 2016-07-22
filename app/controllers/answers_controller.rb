class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :edit, :update, :destroy]
  before_action :set_challenge
  before_action :authenticate_user!

  # GET /answers
  # GET /answers.json
  def index
    @answers = Answer.all
  end

  # GET /answers/1
  # GET /answers/1.json
  def show
  end

  # GET /answers/new
  def new
    @answer = Answer.new
  end

  # GET /answers/1/edit
  def edit
  end
  
  def check_answer
    correct_sql = @challenge.correct_result
    conn = ActiveRecord::Base.establish_connection(
                :adapter => 'sqlite3',
                :database => "db/learn.sqlite3"
    )
    correct_result = conn.connection.exec_query(correct_sql);
    user_sql = answer_params[ :answer_text]
  
    user_result = conn.connection.exec_query(user_sql);
    
    return [user_result.to_hash == correct_result.to_hash, user_result.to_hash]
  rescue => e
    return [false, e.message]
  ensure
    ActiveRecord::Base.establish_connection :development
  end

  # POST /answers
  # POST /answers.json
  def create
    @answer = current_user.answer_for(@challenge) || current_user.answers.new
    @answer.answer_text = answer_params[:answer_text] 
    @answer.challenge_id = @challenge.id
    @answer.is_correctly, @result = check_answer
    
    respond_to do |format|
      if @answer.save
        format.html { render  'challenges/show', notice: 'Answer was successfully created.' }
        format.json { render :show, status: :created, location: @answer }
      else
        format.html { render :new }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /answers/1
  # PATCH/PUT /answers/1.json
  def update
    respond_to do |format|
      if @answer.update(answer_params)
        format.html { redirect_to @answer, notice: 'Answer was successfully updated.' }
        format.json { render :show, status: :ok, location: @answer }
      else
        format.html { render :edit }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /answers/1
  # DELETE /answers/1.json
  def destroy
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to answers_url, notice: 'Answer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = Answer.find(params[:id])
    end
    
    def set_challenge
      ActiveRecord::Base.establish_connection :development
      if params[:challenge_id]
        @challenge = Challenge.find(params[:challenge_id])
      else
        @challenge = @answer.challenge
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_params
      params.require(:answer).permit(:answer_text)
    end
end
