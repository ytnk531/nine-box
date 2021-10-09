class DashboardsController < ApplicationController
  def new
    @answer = Answer.last
    if @answer
      render inline: '<h1>select</h1>'
    else
      render 'new'
    end
  end

  def create
    Answer.create(position: params[:new_answer])
  end
end
