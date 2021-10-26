require 'test_helper'

class SettingAnswerStateTest < ActiveSupport::TestCase
  test 'transpose creates answer with no solver' do
    SettingAnswerState.new.transpose(1, Applicant.new("a"))

    assert_equal(1, Answer.last.position )
    assert_nil(Answer.last.solver_id)
  end

  test 'transpose returns new state' do
    new_state = SettingAnswerState.new.transpose(1, Applicant.new("a"))

    assert_instance_of(InputtingSelectionState, new_state)
  end
end
