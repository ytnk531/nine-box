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


