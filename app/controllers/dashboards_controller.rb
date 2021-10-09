class DashboardsController < ApplicationController
  def index
    render inline: '<h1>hello world</h1>'
  end
end
