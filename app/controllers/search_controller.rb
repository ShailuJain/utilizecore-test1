class SearchController < ApplicationController
  def index
    if params[:search].present?
      @parcels = Parcel.where(tracking_id: params[:search])
    else
      @parcels = []
    end
  end
end
