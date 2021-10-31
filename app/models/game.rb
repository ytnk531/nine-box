# ゲームの状態を表す
class Game
  attr_reader :state

  def initialize
    @state = nil
  end

  def detect_state
    @state = if Answer.all.empty? || Answer.last.solver.present?
                  SettingAnswerState.new
             else
                  InputtingSelectionState.new
             end
    self
  end

  def next(input, user)
    @state = @state.transpose(input, user)
  end

  def message
    @state.message
  end

  def view(user)
    @state.view(user)
  end

  def selector_view
    @state.selector_view
  end

  def answer
    @state.answer
  end

  def box_at(position)
    boxes[position - 1]
  end

  def boxes
    (1..9).map { |pos| Box.new(pos, answer) }
  end
end


