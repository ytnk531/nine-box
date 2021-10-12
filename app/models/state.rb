# ゲームの状態を表す
class State
  def initialize
    @strategy = nil
  end

  def detect
    @strategy = if Answer.last.present?
                  InputtingSelectionStrategy.new
                else
                  SettingAnswerStrategy.new
    end
    self
  end

  def next(input)
    @strategy = @strategy.transpose(input)
  end

  def notice
    @strategy.notice
  end

  def view
    @strategy.view
  end

  def selector_view
    @strategy.selector_view
  end
end

class InputtingSelectionStrategy
  def transpose(input)
    if input.to_i == Answer.last.position
      Answer.last.destroy!
      SettingAnswerStrategy.new
    else
      InputtingSelectionStrategy.new
    end
  end

  def view
    'select'
  end

  def selector_view
    view
  end

  def notice
    "不正解"
  end
end

class SettingAnswerStrategy
  def transpose(input)
    Answer.create!(position: input)
    InputtingSelectionStrategy.new
  end

  def view
    'new'
  end

  def selector_view
    'wait'
  end

  def notice
    "正解。新しい答えを設定してください"
  end
end