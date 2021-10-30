class DashboardsController < ApplicationController
  def new
    state = Game.new.detect_state
    answer = Answer.last
    @boxes = (1..9).map { |pos| Box.new(pos, answer, current_user.id) }
    render state.view(current_user)
  end

  def show
    redirect_to new_dashboard_path
  end

  def select
    game = Game.new.detect_state
    game.next(params[:position].to_i, current_user)

    redirect_to new_dashboard_path, **game.message
  end

  def create
    Answer.create(position: params[:new_answer])
    redirect_to new_dashboard_path
  end
end
