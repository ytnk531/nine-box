
class InputtingSelectionState
  def transpose(input, user)
    if input.to_i == Answer.last.position
      Answer.last.update(solver_id: user.id)
      SettingAnswerState.new
    else
      InputtingSelectionState.new
    end
  end

  def view(_user)
    'select'
  end

  def message
    { alert: "不正解" }
  end
end
