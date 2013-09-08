module Joke

  def self.run(task, path)
    jakefilemanager = Jokefile.load(path)
    whether JobsManager::DependencyNotFound do
      jakefilemanager.execute task
    end
  end

  private
  def self.whether(exception, &block)
    block.call if block_given?
    rescue exception => e
      paint do 
        e.message
     end
  end

  def self.paint
    puts "-" * 60
    puts yield
    puts "-" * 60
  end
  
end

require 'joke/jokefile'
require 'joke/jobs_manager'
require 'joke/job'
require 'joke/version'
require 'joke/cli'