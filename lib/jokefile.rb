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

  class CyclicDetectedError < StandardError; end
  class DependencyNotFound  < StandardError; end

  attr_accessor :jobs
  def initialize
    @jobs = { }
  end

  def add(job)
    @jobs[job.name] = job
  end

  def execute(job)
    execute_dependencies(job)
  end

  private
  def execute_dependencies(job, visited=[])
    detect_cyclic(job, visited)
    return @jobs[job].execute if dependency_from(job).nil?
    execute_dependencies(@jobs[job].dependencies, visited)
    @jobs[job].execute
  end

  def fetch(job)
    @jobs[job] || (raise DependencyNotFound.new(" Job not found: ' #{job} ' in the Jokefile "))
  end

  def dependency_from(job)
    fetch(job).dependencies
  end

  def detect_cyclic(job, visited)
    raise CyclicDetectedError.new("#{job}") if visited.include? job
    visited.push(job)
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
