class DashboardsController < ApplicationController
  def new
    game = Game.new.detect_state
    @boxes = (1..9).map { |pos| Box.new(pos, game.answer, current_user.id) }

    render game.view(current_user)
  end

  def show
    redirect_to new_dashboard_path
  end

  def select
    game = Game.new.detect_state
    box = game.box_at(params[:position].to_i, current_user.id)
    game.next(box.position, current_user)

    respond_to do |format|
      if game.state.instance_of?(InputtingSelectionState)
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(box.dom_id, partial: "dashboards/box", locals: { b: box })
        end
      end
      format.html { redirect_to new_dashboard_path, **game.message }
    end
  end

  def create
    Answer.create(position: params[:new_answer])
    redirect_to new_dashboard_path
  end
end
