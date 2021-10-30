class SettingAnswerState
  def transpose(input, _user)
    Answer.create!(position: input)
    InputtingSelectionState.new
  end

  def view(user)
    if Answer.all.empty? || user == Answer.last.solver
      'new'
    else
      'wait'
    end
  end

  def message
    { notice: "正解です!" }
  end

  def answer
    Answer.new
  end
end
