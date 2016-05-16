require_relative '../test_helper'

class UserSeesAllRobotsTest < FeatureTest
  include TestHelpers

  def test_user_sees_all_tasks
    robot_world.create({
                        name: "Bob",
                        city: "Denver",
                        state: "CO",
                        birthdate: "1990-06-27",
                        date_hired: "2015-05-20",
                        department: "HR",
                        })
    robot_world.create({
                        name: "Henry",
                        city: "Houston",
                        state: "TX",
                        birthdate: "1995-06-27",
                        date_hired: "2014-05-20",
                        department: "IT",
                        })
  #require 'pry';binding.pry
    visit '/robots'
 #save_and_open_page
    assert page.has_content?("18: John")
    #assert page.has_content?("2: Henry")
  end

end
