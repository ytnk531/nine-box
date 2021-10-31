class DashboardsController < ApplicationController
  def new
    game = Game.new.detect_state
    @boxes = game.boxes

    render game.view(current_user)
  end

  def show
    redirect_to new_dashboard_path
  end

  def select
    game = Game.new.detect_state
    box = game.box_at(params[:position].to_i)
    game.next(box.position, current_user)

    game.boxes.each do |b|
      Turbo::StreamsChannel.broadcast_replace_to(
        :boxes, target: b.dom_id, partial: "dashboards/box", locals: { b: b }
      )
    end
    respond_to do |format|
      format.html { redirect_to new_dashboard_path, **game.message }
    end
  end

  def create
    Answer.create(position: params[:new_answer])
    redirect_to new_dashboard_path
  end
end
