class AbstractReviewerAssignmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_abstract_reviewer_assignment, only: [:show, :edit, :update, :destroy]

  # GET /abstract_reviewer_assignments
  # GET /abstract_reviewer_assignments.json
  def index
    @abstract_reviewer_assignments = AbstractReviewerAssignment.all
  end

  # GET /abstract_reviewer_assignments/1
  # GET /abstract_reviewer_assignments/1.json
  def show
  end

  # GET /abstract_reviewer_assignments/new
  def new
    @abstract_reviewer_assignment = AbstractReviewerAssignment.new
  end

  # GET /abstract_reviewer_assignments/1/edit
  def edit
  end

  # POST /abstract_reviewer_assignments
  # POST /abstract_reviewer_assignments.json
  def create
    @abstract_reviewer_assignment = AbstractReviewerAssignment.new(abstract_reviewer_assignment_params)

    respond_to do |format|
      if @abstract_reviewer_assignment.save
        format.html { redirect_to @abstract_reviewer_assignment, notice: 'Abstract reviewer assignment was successfully created.' }
        format.json { render :show, status: :created, location: @abstract_reviewer_assignment }
      else
        format.html { render :new }
        format.json { render json: @abstract_reviewer_assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /abstract_reviewer_assignments/1
  # PATCH/PUT /abstract_reviewer_assignments/1.json
  def update
    respond_to do |format|
      if @abstract_reviewer_assignment.update(abstract_reviewer_assignment_params)
        format.html { redirect_to @abstract_reviewer_assignment, notice: 'Abstract reviewer assignment was successfully updated.' }
        format.json { render :show, status: :ok, location: @abstract_reviewer_assignment }
      else
        format.html { render :edit }
        format.json { render json: @abstract_reviewer_assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /abstract_reviewer_assignments/1
  # DELETE /abstract_reviewer_assignments/1.json
  def destroy
    @abstract_reviewer_assignment.destroy
    respond_to do |format|
      format.html { redirect_to abstract_reviewer_assignments_url, notice: 'Abstract reviewer assignment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_abstract_reviewer_assignment
      @abstract_reviewer_assignment = AbstractReviewerAssignment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def abstract_reviewer_assignment_params
      params.require(:abstract_reviewer_assignment).permit(:abstract_id, :user_id)
    end
end
