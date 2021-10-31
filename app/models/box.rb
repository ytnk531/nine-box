class Box
  attr_reader :position

  def initialize(position, answer)
    @position = position
    @answer = answer
  end

  def answered?
    TouchedPosition.exists?(
      position: position,
      answer: answer,
    )
  end

  def dom_id
    "box_#{position}"
  end

  private

  attr_reader :answer, :answerer_id
end
