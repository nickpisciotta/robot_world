
require 'yaml/store'

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
                              "avatar" => "https://robohash.org/#{robot[:name]}.png",
                              "birthdate" => Time.parse(robot[:birthdate]),
                              "date_hired" => Time.parse(robot[:date_hired]),
                              "department" => robot[:department]}
      #require 'pry';binding.pry
    end
  end

  def average_age
    require 'pry';binding.pry
    (age.reduce(:+))/age.count.to_f
  end

  def age
    raw_robots.each do |robot|
      (Time.now.year - robot["birthdate"].year)
    end
  end

  def raw_robots
    database.transaction do
      database["robots"] || []
    end
  end

  def all
    raw_robots.map {|robot| Robot.new(robot)}
    #require 'pry';binding.pry
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
      target_robot['avatar'] = "https://robohash.org/#{robot[:name]}.png"
      target_robot['birthdate'] = Time.parse(robot[:birthdate])
      target_robot['date_hired'] = Time.parse(robot[:date_hired])
      target_robot['department'] = robot[:department]
    end
  end

  def destroy(id)
    database.transaction do
      database['robots'].delete_if {|robot| robot['id'] == id}
    end
  end

  def delete_all
  database.transaction do
    database['robots'] = []
    database['total'] = 0
  end
end


end
