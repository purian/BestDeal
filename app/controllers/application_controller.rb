class ApplicationController < ActionController::Base
  protect_from_forgery

  def get_traffic_source_from_request
    (URI.parse @_request.env["HTTP_REFERER"]).host
  end
end
