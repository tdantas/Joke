class Jokefile
  
  def job(name, dep = nil, &command)
    Jokefile.job_manager.add(Job.new(name, dep, &command))
  end

  def self.job_manager
    @job_manager ||= ::JobsManager.new
  end

  def self.load(path)
    new.instance_eval(File.read(path)) 
    job_manager
  end

end
