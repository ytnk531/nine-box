require 'test_helper'

class InputtingSelectionStateTest < ActiveSupport::TestCase
  test 'transpose sets solver of last answer with inputted user if input is correct' do
    Answer.create!(position: 3)
    InputtingSelectionState.new.transpose(3, Applicant.new("a"))

    assert_equal("a", Answer.last.solver_id)
  end

  test 'transpose return new state if input is correct' do
    Answer.create!(position: 3)
    state = InputtingSelectionState.new.transpose(3, Applicant.new("a"))

    assert_instance_of(SettingAnswerState, state)
  end

  test 'transpose return the same state if input is incorrect' do
    Answer.create!(position: 3)
    state = InputtingSelectionState.new.transpose(2, Applicant.new("a"))

    assert_instance_of(InputtingSelectionState, state)
  end
end
