class ApplicationController < ActionController::Base
  protect_from_forgery

  def get_host_from_uri
    require 'uri'
    uri = URI.parse @_request.env["HTTP_REFERER"]
    host = uri.host
    return host
  end
end
