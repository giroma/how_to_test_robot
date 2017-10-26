require 'minitest/autorun'
require 'minitest/pride'
require './robot.rb'

class TestRobot < MiniTest::Test

  def test_that_foreign_robot_needing_repairs_sent_to_station_1

    # arrange
    robot = Robot.new
    robot.foreign_model = true
    robot.needs_repairs = true
    # act
    actual = robot.station
    # assert
    expected = 1
    assert_equal(actual, expected)
  end

  def test_that_vintage_robot_needing_repairs_sent_to_station_2
    # arrange
    robot = Robot.new
    robot.vintage_model = true
    robot.needs_repairs = true
    # act
    actual = robot.station
    # assert
    expected = 2
    assert_equal(actual, expected)
  end

  def test_that_standard_robot_needing_repairs_sent_to_station_3
    # arrange
    robot = Robot.new

    robot.needs_repairs = true
    # act
    actual = robot.station
    # assert
    expected = 3
    assert_equal(actual, expected)
  end

  def test_that_robot_in_good_condition_sent_to_station_4
    # arrange
    robot = Robot.new
    robot.foreign_model = true
    robot.needs_repairs = false
    # act
    actual = robot.station
    # assert
    expected = 4
    assert_equal(actual, expected)
  end

  def test_prioritize_tasks_with_empty_todo_list_returns_negative_one
    # arrange
    robot = Robot.new
    robot.foreign_model = true
    robot.needs_repairs = true
    # act
    actual = robot.prioritize_tasks
    # assert
    eexpected = -1
    assert_equal(eexpected, actual )
  end

  def test_prioritize_tasks_with_todos_returns_max_todo_value
    # arrange
    robot = Robot.new
    robot.foreign_model = true
    robot.needs_repairs = true

    robot.todos = [12]
    # act
    actual = robot.prioritize_tasks
    # assert
    eexpected = robot.todos.max
    assert_equal(eexpected, actual )
  end

  def test_workday_on_day_off_returns_false
    # arrange
    robot = Robot.new
    robot.day_off = "Sunday"

    # act
    actual = robot.workday?("Sunday")
    # assert
    eexpected = false
    assert_equal(eexpected, actual )
  end

  def test_workday_not_day_off_returns_true
    # arrange
    robot = Robot.new
    robot.day_off = "Sunday"

    # act
    actual = robot.workday?("Friday")
    # assert
    eexpected = true
    assert_equal(eexpected, actual )
  end

end
