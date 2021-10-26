class RemoveUserFromAnswer < ActiveRecord::Migration[7.0]
  def change
    remove_reference :answers, :solver, null: false, foreign_key: { to_table: :users }
  end
end
