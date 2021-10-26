require 'test_helper'

class StateTest < ActiveSupport::TestCase
  test "view returns select when there is no answer" do
    Answer.delete_all
    state = Game.new.detect_state

    assert_equal 'new', state.view(Applicant.new("1001"))
  end

  test "view returns new when newest answer is solved by passed user" do
    Answer.create!(solver_id: "0001", position: 1)
    state = Game.new.detect_state

    assert_equal 'new', state.view(Applicant.new("0001"))
  end

  test "view returns wait when newest answer is solved by other user" do
    Answer.create!(solver_id: "0001", position: 1)
    state = Game.new.detect_state

    assert_equal 'wait', state.view(Applicant.new("0002"))
  end

  test "view returns select when newest answer has not been solved" do
    Answer.create!(solver_id: nil, position: 1)
    state = Game.new.detect_state

    assert_equal 'select', state.view(Applicant.new("001"))
  end

  test "" do
  end
end