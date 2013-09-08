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