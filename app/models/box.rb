class Box
  attr_reader :position

  def initialize(position, answer, answerer_id)
    @position = position
    @answer = answer
    @answerer_id = answerer_id
  end

  def answered?
    TouchedPosition.exists?(
      position: position,
      answer: answer,
      answerer_id: answerer_id
    )
  end

  private

  attr_reader :answer, :answerer_id
end
