
class RobotWorldApp < Sinatra::Base
   #set :root, File.expand_path("..", __dir__)
  # set :method_override, true

  get '/' do
    # @age = @robot_world.average_age#(then do statistic logic within robot_world and call it within dashboard)
    erb :dashboard
  end

  get '/robots' do
    # require 'pry';binding.pry
    @robots = robot_world.all
    erb :index
  end

  get '/robots/new' do
    erb :new
  end

  post '/robots' do
    robot_world.create(params[:robot])
    redirect '/robots'
  end

  get '/robots/:id' do |id|
    @robot = robot_world.find(id.to_i)
    erb :show
  end

  get '/robots/:id/edit' do |id|
    @robot = robot_world.find(id.to_i)
    #require 'pry';binding.pry
    erb :edit
  end

  put '/robots/:id' do |id|
    robot_world.update(id.to_i, params[:robot])
    redirect "/robots/#{id}"
  end

  delete '/robots/:id' do |id|
    robot_world.destroy(id.to_i)
    redirect '/robots'
  end

  def robot_world
    if ENV['RACK-ENV'] == "test"
      database = YAML::Store.new('db/robot_world_test')
    else
      database = YAML::Store.new('db/robot_world')
    end
    @robot_world ||= RobotWorld.new(database)
  end
  
end
