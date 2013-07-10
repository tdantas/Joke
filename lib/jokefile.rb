class Jokefile
  
  def job(name, dep = nil, &command)
    Jokefile.job_manager.add(Job.new(name, dep, &command))
  end

  def self.job_manager
    @job_manager ||= JobsManager.new
  end

  def self.load(path)
    new.instance_eval(File.read(path)) 
    job_manager
  end
end

  class JobsManager
    def initialize
      @jobs={}
    end

    def add(job)
      @jobs[job.name] = job
    end

    def execute(job)
      execute_dependencies(job)
    end

    private
    def execute_dependencies(job, visited=[])
      raise "CICLYC DETECTED '#{task}'" if visited.include? job
      visited.push(job)
      return @jobs[job].execute if(@jobs[job].dependencies.nil?)
      execute_dependencies(@jobs[job].dependencies, visited)
      @jobs[job].execute
    end

  end

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
