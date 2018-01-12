class AbstractReportsController < ApplicationController
  before_action :set_abstract_report, only: [:show, :edit, :update, :destroy]

  # GET /abstract_reports
  # GET /abstract_reports.json
  def index
    @abstract_reports = AbstractReport.all
  end

  # GET /abstract_reports/1
  # GET /abstract_reports/1.json
  def show
  end

  # GET /abstract_reports/new
  def new
    @abstract_report = AbstractReport.new
  end

  # GET /abstract_reports/1/edit
  def edit
  end

  # POST /abstract_reports
  # POST /abstract_reports.json
  def create
    @abstract_report = AbstractReport.new(abstract_report_params)

    respond_to do |format|
      if @abstract_report.save
        format.html { redirect_to @abstract_report, notice: 'Abstract report was successfully created.' }
        format.json { render :show, status: :created, location: @abstract_report }
      else
        format.html { render :new }
        format.json { render json: @abstract_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /abstract_reports/1
  # PATCH/PUT /abstract_reports/1.json
  def update
    respond_to do |format|
      if @abstract_report.update(abstract_report_params)
        format.html { redirect_to @abstract_report, notice: 'Abstract report was successfully updated.' }
        format.json { render :show, status: :ok, location: @abstract_report }
      else
        format.html { render :edit }
        format.json { render json: @abstract_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /abstract_reports/1
  # DELETE /abstract_reports/1.json
  def destroy
    @abstract_report.destroy
    respond_to do |format|
      format.html { redirect_to abstract_reports_url, notice: 'Abstract report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_abstract_report
      @abstract_report = AbstractReport.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def abstract_report_params
      params.require(:abstract_report).permit(:abstractId, :recommendation, :innovation, :breadth, :presentationQuality, :publicContent, :notes)
    end
end
