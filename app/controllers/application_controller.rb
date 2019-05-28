# frozen_string_literal: true

class ApplicationController < ActionController::API
  rescue_from IndexError, with: :record_not_found
  rescue_from ArgumentError, with: :invalid_parameter
  
  private
  
  def record_not_found(error)
    render(
      status: 404,
      json: {
        status: 404,
        errors: [{
          type: error.class.to_s,
          message: error.message
        }]
      }
    )
  end
  
  def invalid_parameter(error)
    render(
      status: 400,
      json: {
        status: 400,
        errors: [{
          type: error.class.to_s,
          message: error.message
        }]
      }
    )
  end
  
end
