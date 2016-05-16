require_relative '../test_helper'

class RobotWorldTest < Minitest::Test
  include TestHelpers

  def test_it_creates_a_task
    #require 'pry';binding.pry
    robot_id = robot_world.create({
                        name: "Henry",
                        city: "Denver",
                        state: "CO",
                        avatar: "https://robohash.org/Bob.png",
                        birthdate: "1990-06-27",
                        date_hired: "2015-05-20",
                        department: "HR",
                        })
    robot = robot_world.find(robot_id)
    binding.pry
    assert_equal "Henry", robot.name
    assert_equal "Denver", robot.city
    assert_equal "HR", robot.department
  end

  # def test_it_finds_all_tasks
  #   robot_world.create({
  #                       name: "Bob",
  #                       city: "Denver",
  #                       state: "CO",
  #                       birthdate: "1990-06-27",
  #                       date_hired: "2015-05-20",
  #                       department: "HR",
  #                       })
  #   robot_world.create({
  #                       name: "Henry",
  #                       city: "Houston",
  #                       state: "TX",
  #                       birthdate: "1995-06-27",
  #                       date_hired: "2014-05-20",
  #                       department: "IT",
  #                       })
  #
  #   robots = robot_world.all
  #
  #   assert_equal 2, robots.size
  #   assert_equal "Bob", robots[0].name
  #   assert_equal "Henry", robots[1].name
  #   assert_equal "Denver", robots[0].city
  #   assert_equal "Houston", robots[1].city
  # end
  #
  # def test_it_finds_specific_tasks
  #   robot_world.create({
  #                       name: "Bob",
  #                       city: "Denver",
  #                       state: "CO",
  #                       birthdate: "1990-06-27",
  #                       date_hired: "2015-05-20",
  #                       department: "HR",
  #                       })
  #   robot_world.create({
  #                       name: "Henry",
  #                       city: "Houston",
  #                       state: "TX",
  #                       birthdate: "1995-06-27",
  #                       date_hired: "2014-05-20",
  #                       department: "IT",
  #                       })
  #
  #   robot1 = robot_world.find(1)
  #   robot2 = robot_world.find(2)
  #
  #   assert_equal "Bob", robot1.name
  #   assert_equal "Henry", robot2.name
  # end
  #
  # def test_it_can_update_information
  #   robot_world.create({
  #                       name: "Bob",
  #                       city: "Denver",
  #                       state: "CO",
  #                       birthdate: "1990-06-27",
  #                       date_hired: "2015-05-20",
  #                       department: "HR",
  #                       })
  #   robot_world.update(1, {
  #                       name: "Henry",
  #                       city: "Houston",
  #                       state: "TX",
  #                       birthdate: "1990-06-27",
  #                       date_hired: "2015-05-20",
  #                       department: "HR",
  #                       })
  #
  #   robot = robot_world.find(1)
  #
  #   assert_equal "Henry", robot.name
  #   assert_equal "Houston", robot.city
  #   assert_equal "TX", robot.state
  #   assert_equal "HR", robot.department
  #   assert_equal "1990-06-27 00:00:00 -0600", "#{robot.birthdate}"
  # end
  #
  # def test_it_can_destroy_task
  #   robot_world.create({
  #                       name: "Bob",
  #                       city: "Denver",
  #                       state: "CO",
  #                       birthdate: "1990-06-27",
  #                       date_hired: "2015-05-20",
  #                       department: "HR",
  #                       })
  #   robot_world.create({
  #                       name: "Henry",
  #                       city: "Houston",
  #                       state: "TX",
  #                       birthdate: "1995-06-27",
  #                       date_hired: "2014-05-20",
  #                       department: "IT",
  #                       })
  #
  #
  #   assert_equal 2, robot_world.all.size
  #
  #   robot_world.destroy(1)
  #
  #   assert_equal 1, robot_world.all.size
  # end

end
