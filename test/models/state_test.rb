require 'test_helper'

class StateTest < ActiveSupport::TestCase
  test "view returns select when there is no answer" do
    Answer.delete_all
    state = Game.new.detect

    assert_equal 'new', state.view(users(:one))
  end

  test "view returns new when newest answer is solved by passed user" do
    Answer.create!(solver: users(:one), position: 1)
    state = Game.new.detect

    assert_equal 'new', state.view(users(:one))
  end

  test "view returns wait when newest answer is solved by other user" do
    Answer.create!(solver: users(:one), position: 1)
    state = Game.new.detect

    assert_equal 'wait', state.view(users(:two))
  end

  test "view returns select when newest answer has not been solved" do
    Answer.create!(solver: nil, position: 1)
    state = Game.new.detect

    assert_equal 'select', state.view(users(:two))
  end
end