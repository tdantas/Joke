require_relative './version'
require_relative './joke'

require 'singleton'
require 'optparse'
require 'ostruct'
require 'pry'

module Joke
  class CLI
    include Singleton

    def parse(argv)
      @options = OpenStruct.new
      @options.jokefile = './Jokefile' 
      @options.list     =  false

      @parser = OptionParser.new do |o|
        o.on '-j', '--jokefile PATH', "path to Jokefile" do |arg|
          @options.jokefile = arg
        end

        o.on '-l', '--list', "list jobs descriptions" do |arg|
          @options.list = arg
        end

        o.on '-v', '--version', "Print version and exit" do |arg|
          puts "joke #{Joke::VERSION}"
          exit(0)
        end
      end

      @parser.banner = "joke [options] job_name"
      @parser.on_tail "-h", "--help", "Show help" do 
        puts @parser
        exit(1)
      end 
      
      jobs = @parser.parse!(argv)
      jobs.last
      if(jobs.length > 1) 
        puts "-" * 65
        puts "Warning: Multiple Jobs to be executed #{@parser.default_argv}"
        puts "Executing only the last job '#{jobs.last}'"
        puts "-" * 65
      end
      @options.job = jobs.last
      @options
    end

    def run
      Joke.run @options.job, @options.jokefile
    end

  end
end