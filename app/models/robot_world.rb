require 'yaml/store'
require_relative 'robot'

class RobotWorld
  attr_reader :database

  def initialize(database)
    @database = database
  end

  def create(robot)

    database.transaction do
      database['robots'] ||= []
      database['total'] ||= 0
      database['total'] += 1
      database['robots'] << { "id" => database['total'],
                              "name" => robot[:name],
                              "city" => robot[:city],
                              "state" => robot[:state],
                              "avatar" => robot[:avatar], #insert link for pic interpolate name
                              "birthdate" => Time.parse(robot[:birthdate]),
                              "date hired" => Time.parse(robot[:date_hired]),
                              "department" => robot[:department]}
    end
  end

  def raw_robots
    database.transaction do
      database["robots"] || []
    end
  end

  def all
    raw_robots.map {|robot| Robot.new(robot)}
  end

  def raw_robot(id)
    raw_robots.find {|robot| robot["id"] == id}
  end

  def find(id)
    Robot.new(raw_robot(id))
  end

  def update(id, robot)
    database.transaction do
      target_robot = database['robots'].find {|data| data["id"] == id}
      target_robot['name'] = robot[:name]
      target_robot['city'] = robot[:city]
      target_robot['state'] = robot[:state]
      target_robot['avatar'] = robot[:avatar] #insert link to robot pic
      target_robot['birthdate'] = Time.parse(robot[:birthdate])
      target_robot['date hired'] = Time.parse(robot[:date_hired])
      target_robot['department'] = robot[:department]
    end
  end

  def destroy(id)
    database.transaction do
      database['robots'].delete_if {|robot| robot['id'] == id}
    end
  end


end
