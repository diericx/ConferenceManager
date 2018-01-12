class AbstractProposalsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_abstract_proposal, only: [:show, :edit, :update, :destroy]

  # GET /abstract_proposals
  # GET /abstract_proposals.json
  def index
    @abstract_proposals = AbstractProposal.all
  end

  # GET /abstract_proposals/1
  # GET /abstract_proposals/1.json
  def show
  end

  # GET /abstract_proposals/new
  def new
    @abstract_proposal = AbstractProposal.new
    @conferences = Conference.all
  end

  # GET /abstract_proposals/1/edit
  def edit
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
      params.require(:abstract_proposal).permit(:title, :url, :conference_id)
    end
end
