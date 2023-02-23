class ReportsController < ApplicationController
  # GET /reports or /reports.json
  def index
    @reports = Report.all
  end

  def download
    @report = Report.find(params[:id])
    send_file(@report.path)
  end
end
