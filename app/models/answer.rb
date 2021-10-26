class Answer < ApplicationRecord
  def solver
    solver_id && Applicant.new(solver_id)
  end
end
