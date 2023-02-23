class ParcelReportWorker
  include Sidekiq::Worker

  OFFSET = 1.hour
  def perform
    start_time = (Time.zone.now - OFFSET).beginning_of_day
    end_time = Time.zone.now

    GenerateParcelReport.call(start_time, end_time)
  end
end
