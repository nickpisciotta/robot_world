require_relative '../test_helper'

class RobotTest < Minitest::Test

  def test_it_assigns_attributes_correctly
    robot = Robot.new({"id" => 1,
                    "name" => "Bob",
                    "city" => "Denver",
                    "state" => "CO",
                    "birthdate" =>Time.parse("1990-06-27"),
                    "date_hired" =>Time.parse("2015-05-20"),
                    "department" => "HR",
                    })

    assert_equal 1, robot.id
    assert_equal "Bob", robot.name
    assert_equal "Denver", robot.city
    assert_equal "1990-06-27 00:00:00 -0600", "#{robot.birthdate}"
    assert_equal "HR", robot.department
  end

end
