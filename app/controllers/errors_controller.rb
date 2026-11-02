class ErrorsController < ApplicationController
  def not_found
    render status: request.path == '/500' ? :internal_server_error : :not_found
  end
end
