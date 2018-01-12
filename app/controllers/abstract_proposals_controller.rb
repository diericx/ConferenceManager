class AbstractProposalsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_abstract_proposal, only: [:show, :edit, :update, :destroy]

  # GET /abstract_proposals
  # GET /abstract_proposals.json
  def index
    # get proposals for this user
    @abstract_proposals = []
    if current_user.admin then
      @abstract_proposals = AbstractProposal.all
    else 
      current_users_assigned_proposals = AbstractReviewerAssignment.where(user_id: current_user.id).each do |assignment|
        @abstract_proposals.push(AbstractProposal.find(assignment.abstract_id))
      end
    end
  end

  # GET /abstract_proposals/1
  # GET /abstract_proposals/1.json
  def show
    # Report this user has submitted
    @user_submitted_report = AbstractReport.where('(abstractId= ? AND reviewerId= ?)', @abstract_proposal.id, current_user.id)
    # Users assigned to review this report
    @reviewers = AbstractReviewerAssignment.where(abstract_id: @abstract_proposal.id)
    # potential new report
    @abstract_report = AbstractReport.new
    # Get conference name for this Abstract
    @conference_name = Conference.find(@abstract_proposal.conference_id).name
  end

  # GET /abstract_proposals/new
  def new
    @abstract_proposal = AbstractProposal.new
    @conferences = Conference.all
  end

  # GET /abstract_proposals/1/edit
  def edit
    @conferences = Conference.all
  end

  # POST /abstract_proposals
  # POST /abstract_proposals.json
  def create
    @abstract_proposal = AbstractProposal.new(abstract_proposal_params)
    respond_to do |format|
      if @abstract_proposal.save
        format.html { redirect_to @abstract_proposal, notice: 'Abstract proposal was successfully created.' }
        format.json { render :show, status: :created, location: @abstract_proposal }
      else
        format.html { render :new }
        format.json { render json: @abstract_proposal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /abstract_proposals/1
  # PATCH/PUT /abstract_proposals/1.json
  def update
    respond_to do |format|
      if @abstract_proposal.update(abstract_proposal_params)
        format.html { redirect_to @abstract_proposal, notice: 'Abstract proposal was successfully updated.' }
        format.json { render :show, status: :ok, location: @abstract_proposal }
      else
        format.html { render :edit }
        format.json { render json: @abstract_proposal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /abstract_proposals/1
  # DELETE /abstract_proposals/1.json
  def destroy
    @abstract_proposal.destroy
    respond_to do |format|
      format.html { redirect_to abstract_proposals_url, notice: 'Abstract proposal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_abstract_proposal
      @abstract_proposal = AbstractProposal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def abstract_proposal_params
      params.require(:abstract_proposal).permit(:title, :url, :contact_name, :contact_email, :organization, :proposed_format, :conference_id)
    end
end
