class ReviewerAssignmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_reviewer_assignment, only: [:show, :edit, :update, :destroy]
  
  # GET /reviewer_assignments
  # GET /reviewer_assignments.json
  def index
    @reviewer_assignments = ReviewerAssignment.all
  end

  # GET /reviewer_assignments/1
  # GET /reviewer_assignments/1.json
  def show
  end

  # GET /reviewer_assignments/new
  def new
    @reviewer_assignment = ReviewerAssignment.new
  end

  # GET /reviewer_assignments/1/edit
  def edit
  end

  # POST /reviewer_assignments
  # POST /reviewer_assignments.json
  def create

    # get parameters
    email = params[:reviewer_assignment][:email]
    submission_id = params[:reviewer_assignment][:submission_id]
    # attempt to find user by email
    user = User.find_by email: email
    if user == nil
      respond_to do |format|
        format.html { redirect_to Submission.find(submission_id), alert: "User not found!"}
        format.json { head :ok }
      end
      return
    end

    # remove invalid email param
    params[:reviewer_assignment].delete :email

    # create new ARA
    @reviewer_assignment = ReviewerAssignment.new(reviewer_assignment_params)
    # set newly found user id 
    @reviewer_assignment.user_id = user.id

    respond_to do |format|
      if @reviewer_assignment.save
        format.html { redirect_to Submission.find(submission_id), notice: 'Reviewer was successfully assigned.' }
      else
        format.html { render :new }
        format.json { render json: @reviewer_assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviewer_assignments/1
  # PATCH/PUT /reviewer_assignments/1.json
  def update
    respond_to do |format|
      if @reviewer_assignment.update(reviewer_assignment_params)
        format.html { redirect_to @reviewer_assignment, notice: 'Reviewer assignment was successfully updated.' }
        format.json { render :show, status: :ok, location: @reviewer_assignment }
      else
        format.html { render :edit }
        format.json { render json: @reviewer_assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviewer_assignments/1
  # DELETE /reviewer_assignments/1.json
  def destroy
    @reviewer_assignment.destroy
    respond_to do |format|
      format.html { redirect_to reviewer_assignments_url, notice: 'Reviewer assignment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reviewer_assignment
      @reviewer_assignment = ReviewerAssignment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reviewer_assignment_params
      params.require(:reviewer_assignment).permit(:submission_id, :user_id, :email)
    end
end
