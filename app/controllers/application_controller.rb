class ApplicationController < ActionController::Base
  include Authentication
  include UpdateAddress
end
