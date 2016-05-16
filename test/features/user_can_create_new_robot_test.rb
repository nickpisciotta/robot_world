require_relative '../test_helper'

class UserCanCreateNewRobotTest <FeatureTest
  include TestHelpers

  def test_user_creates_robot
    visit '/'

    click_link "Add New Robot"

    fill_in 'robot[name]', with: "Bob"
    fill_in 'robot[city]', with: "Denver"
    fill_in 'robot[state]', with: "CO"
    fill_in 'robot[birthdate]', with: "1990-06-27"
    fill_in 'robot[date_hired]', with: "2015-05-20"
    fill_in 'robot[department]', with: "HR"


    click_button "Submit"

    assert page.has_content?("Bob")
  end

end
