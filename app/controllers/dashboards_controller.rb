class DashboardsController < ApplicationController
  def new
    state = Game.new.detect_state
    render state.view(current_user)
  end

  def show
    redirect_to new_dashboard_path
  end

  def select
    state = Game.new.detect_state
    state.next(params[:position].to_i, current_user)

    redirect_to new_dashboard_path, **state.message
  end

  def create
    Answer.create(position: params[:new_answer])
    redirect_to new_dashboard_path
  end
end
