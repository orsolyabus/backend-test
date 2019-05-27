# frozen_string_literal: true

class WorkstationsController < ApplicationController
  def show
    station = Workstation.find(params[:id], params[:include])
    render json: station
  end
  def index
    # puts DATA
    render json: Workstation.all
  end
end
