class DashboardsController < ApplicationController
  def new
    @answer = Answer.last
    if @answer
      render 'select'
    else
      render 'new'
    end
  end

  def select
    @selection = params[:position]
    pp @selection
    pp Answer.last.position
    if @selection == Answer.last.position.to_s
      Answer.last.destroy!
      flash.now[:notice] = "正解。新しい答えを設定してください"
      render 'new'
    else
      flash.now[:notice] = "不正解"
      render 'select'
    end
  end

  def create
    Answer.create(position: params[:new_answer])
    redirect_to new_dashboard_path
  end
end
