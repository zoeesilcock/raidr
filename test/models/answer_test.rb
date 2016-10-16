require 'test_helper'

class AnswerTest < ActiveSupport::TestCase
  def answer_attributes
    { user: User.first, group: Group.first, available: true, date: Date.new }
  end

  test "that it requires a user" do
    answer = Answer.new answer_attributes.merge(user: nil)
    assert_not answer.save, "Saved without a user"
  end

  test "that it requires a group" do
    answer = Answer.new answer_attributes.merge(group: nil)
    assert_not answer.save, "Saved without a group"
  end

  test "that it requires a date" do
    answer = Answer.new answer_attributes.merge(date: nil)
    assert_not answer.save, "Saved without a date"
  end
end
