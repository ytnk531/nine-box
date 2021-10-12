class DashboardsController < ApplicationController
  def new
    state = State.new.detect
    render state.selector_view
  end

  def select
    state = State.new.detect
    state.next(params[:position].to_i)
    flash.now[:notice] = state.notice
    render state.view
end

  def create
    Answer.create(position: params[:new_answer])
    redirect_to new_dashboard_path
  end
end
