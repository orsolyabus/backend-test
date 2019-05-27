# frozen_string_literal: true

class WorkstationsController < ApplicationController
  def show
    station = Workstation.find(params[:id], params[:include])
    render json: station
  end
  def index
    render json: Workstation.all(params[:include])
  end
end
