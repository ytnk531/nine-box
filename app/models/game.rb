# ゲームの状態を表す
class Game
  def initialize
    @strategy = nil
  end

  def detect_state
    @strategy = if Answer.all.empty? || Answer.last.solver.present?
                  SettingAnswerState.new
                else
                  InputtingSelectionState.new
                end
    self
  end

  def next(input, user)
    @strategy = @strategy.transpose(input, user)
  end

  def message
    @strategy.message
  end

  def view(user)
    @strategy.view(user)
  end

  def selector_view
    @strategy.selector_view
  end
end

class InputtingSelectionState
  def transpose(input, user)
    if input.to_i == Answer.last.position
      Answer.last.update(solver: user)
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

class SettingAnswerState
  def new(user, solver)
    @user = user
    @solver = solver
  end

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
end