class AddSolverToAnswer < ActiveRecord::Migration[7.0]
  def change
    add_reference :answers, :solver, null: true, foreign_key: {to_table: :users}
  end
end
