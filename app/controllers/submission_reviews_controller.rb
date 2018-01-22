class SubmissionReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_submission_review, only: [:show, :edit, :update, :destroy]

  # GET /submission_reviews
  # GET /submission_reviews.json
  def index
    @submission_reviews = SubmissionReview.all
  end

  # GET /submission_reviews/1
  # GET /submission_reviews/1.json
  def show
  end

  # GET /submission_reviews/new
  def new
    @submission_review = SubmissionReview.new
  end

  # GET /submission_reviews/1/edit
  def edit
  end

  # POST /submission_reviews
  # POST /submission_reviews.json
  def create
    @submission_review = SubmissionReview.new(submission_review_params)

    respond_to do |format|
      if @submission_review.save
        submission = Submission.find(@submission_review.submission_id)
        if @submission_review.final
          format.html { redirect_to "/submissions/all", notice: 'Submission review was successfully updated.' }
        else
          format.html { redirect_to "/", notice: 'Submission review was successfully updated.' }
        end        # format.json { render :show, status: :created, location: @abstract_report }
      else
        format.html { render :new }
        format.json { render json: @submission_review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /submission_reviews/1
  # PATCH/PUT /submission_reviews/1.json
  def update
    respond_to do |format|
      if @submission_review.update(submission_review_params)
        if @submission_review.final
          format.html { redirect_to "/submissions/all", notice: 'Submission review was successfully updated.' }
        else
          format.html { redirect_to "/", notice: 'Submission review was successfully updated.' }
        end
      else
        format.html { render :edit }
        format.json { render json: @submission_review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /submission_reviews/1
  # DELETE /submission_reviews/1.json
  def destroy
    @submission_review.destroy
    respond_to do |format|
      format.html { redirect_to submissions_url, notice: 'Submission review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_submission_review
      @submission_review = SubmissionReview.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def submission_review_params
      params.require(:submission_review).permit(:submission_id, :reviewer_id, :recommendation, :innovation, :breadth, :presentation_quality, :public_content, :conflict_of_interest, :notes, :final)
    end
end
