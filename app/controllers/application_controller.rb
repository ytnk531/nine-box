class ApplicationController < ActionController::Base
  def current_user
    id = session[:applicant_id]
    if id.blank?
      id = Applicant.new_id
      session[:applicant_id] = id
    end
    Applicant.new(id)
  end
end
