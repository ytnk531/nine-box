class AddSolverIdToAnswers < ActiveRecord::Migration[7.0]
  def change
    add_column :answers, :solver_id, :string
  end
end
