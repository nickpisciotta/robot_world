require 'bundler'
Bundler.require

databases = [ Sequel.postgres("robot_world"), Sequel.postgres("robot_world_test") ]

databases.each do |database|
  require 'pry';binding.pry
  database.create_table :robots do
    primary_key :id
    String      :name
    String      :city
    String      :state
    String      :avatar
    String      :birthdate
    String      :date_hired
    String      :department
  end
end
