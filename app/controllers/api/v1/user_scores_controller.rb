class Api::V1::UserScoresController < ApplicationController
  before_action :set_user_score, only: [:show, :update, :destroy]

  # GET /user_scores
  def index
    @user_scores = UserScore.all

    render json: @user_scores
  end

  # GET /user_scores/1
  def show
    render json: @user_score
  end

  def get_high_score
    @high_score = UserScore.order("score DESC").order("created_at DESC").first
    render json: @high_score
  end

  # POST /user_scores
  def create
    @user_score = UserScore.new(user_score_params)

    if @user_score.save
      #render json: @user_score, status: :created, location: @user_score
      render json: @user_score, status: :created
    else
      render json: @user_score.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /user_scores/1
  def update
    if @user_score.update(user_score_params)
      render json: @user_score
    else
      render json: @user_score.errors, status: :unprocessable_entity
    end
  end

  # DELETE /user_scores/1
  def destroy
    @user_score.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_score
      @user_score = UserScore.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_score_params
      params.require(:user_score).permit(:name, :score)
    end
end
