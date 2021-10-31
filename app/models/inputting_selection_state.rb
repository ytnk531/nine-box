class InputtingSelectionState
  def transpose(input, user)
    if input.to_i == Answer.last.position
      Answer.last.update(solver_id: user.id)
      SettingAnswerState.new
    else
      TouchedPosition.create(answerer_id: user.id, position: input, answer: Answer.last)
      InputtingSelectionState.new
    end
  end

  def view(_user)
    'select'
  end

  def message
    { alert: "不正解" }
  end

  def answer
    Answer.last
  end
end
