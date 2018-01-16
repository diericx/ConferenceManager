class SubmissionsController < ApplicationController
  include ApplicationHelper
  include SubmissionsHelper
  before_action :authenticate_user!
  before_action :set_submission, only: [:show, :edit, :update, :destroy]

  # GET /submissions
  # GET /submissions.json
  def index
    # get proposals for this user
    @submissions = []
    # arrays for data for each proposal
    @reviews_percent = []
    @assigned_reviewers = []
    @innovation = []
    @breadth = []
    @quality = []
    @recommendation = []

    if is_admin?(current_user) then
      @submissions = Submission.all
    else 
      current_users_assigned_proposals = ReviewerAssignment.where(user_id: current_user.id).each do |assignment|
        @submissions.push(Submission.find(assignment.submission_id))
      end
    end

    # fills in the data tables for each proposal
    get_data_for_each_proposal()
    
  end

  # GET /submissions/1
  # GET /submissions/1.json
  def show
    # Review this user has submitted
    @user_submitted_review = SubmissionReview.where('(submission_id= ? AND reviewer_id= ?)', @submission.id, current_user.id)
    # Users assigned to review this report
    @reviewers = ReviewerAssignment.where(submission_id: @submission.id)
    # potential new report
    @submission_review = SubmissionReview.new
    # Get conference name for this Submission
    @conference_name = Conference.find(@submission.conference_id).name
  end

  # GET /submissions/new
  def new
    @submission = Submission.new
    @conferences = Conference.all
  end

  # GET /submissions/1/edit
  def edit
    @conferences = Conference.all
  end

  # POST /submissions
  # POST /submissions.json
  def create
    @submission = Submission.new(submission_params)
    respond_to do |format|
      if @submission.save
        format.html { redirect_to @submission, notice: 'Submission proposal was successfully created.' }
        format.json { render :show, status: :created, location: @submission }
      else
        format.html { render :new }
        format.json { render json: @submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /submissions/1
  # PATCH/PUT /submissions/1.json
  def update
    respond_to do |format|
      if @submission.update(submission_params)
        format.html { redirect_to @submission, notice: 'Submission proposal was successfully updated.' }
        format.json { render :show, status: :ok, location: @submission }
      else
        format.html { render :edit }
        format.json { render json: @submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /submissions/1
  # DELETE /submissions/1.json
  def destroy
    @submission.destroy
    respond_to do |format|
      format.html { redirect_to submissions_url, notice: 'Submission proposal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def report
    only_admins()

    reviewerAssignments = ReviewerAssignment.all
    @lazy_users = Hash.new

    # get all users who haven't submitted their reports
    reviewerAssignments.each do |assignment|
      review = SubmissionReview.where(submission_id: assignment.submission_id, reviewer_id: assignment.user_id)
      # if there is no matching report
      if review.length == 0
        user = User.find(assignment.user_id)
        if @lazy_users[user.email] == nil
          @lazy_users[user.email] = 1
        else
          @lazy_users[user.email] += 1
        end
        
      end
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_submission
      @submission = Submission.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def submission_params
      params.require(:submission).permit(:title, :url, :contact_name, :contact_email, :organization, :proposed_format, :conference_id)
    end
end
