require 'joke'
require 'jokefile'

module FixtureRegistry
  @registry = {
    one_task:  File.expand_path(File.join('..', 'fixture', 'jokefile_one_task'), __FILE__),
    two_tasks: File.expand_path(File.join('..', 'fixture', 'jokefile_two_tasks'), __FILE__),
    deploy:    File.expand_path(File.join('..', 'fixture', 'jokefile_dependency'), __FILE__),
    self_cyclic: File.expand_path(File.join('..', 'fixture', 'jokefile_selfcyclic'), __FILE__),
    cyclic:     File.expand_path(File.join('..', 'fixture', 'jokefile_cyclic'), __FILE__),
  }

  def [](val)
    @registry[val]
  end

  extend self
end

