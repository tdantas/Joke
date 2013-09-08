class Job
  attr_accessor :name, :command, :dependencies
  
  def initialize(name, dependencies = nil, &command)
    @name = name
    @dependencies = dependencies || nil
    @command = command
  end

  def execute
    @command.call
  end
end