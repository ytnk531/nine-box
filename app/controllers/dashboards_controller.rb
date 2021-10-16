class DashboardsController < ApplicationController
  def new
    state = Game.new.detect
    render state.selector_view
  end

  def select
    state = Game.new.detect
    state.next(params[:position].to_i)
    flash.now[:notice] = state.notice
    render state.view
end

  def create
    Answer.create(position: params[:new_answer])
    redirect_to new_dashboard_path
  end
end
