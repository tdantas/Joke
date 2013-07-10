require_relative './jokefile'

class Joke

  def self.run(task, path)
    jakefilemanager = Jokefile.load(path)
    jakefilemanager.execute task
  end
end