require 'spec_helper'

describe Joke::CLI do
  before do  
    @cli =  Joke::CLI.instance    
  end

  it "changes the jokefile path" do
    @options = @cli.parse(['-j', '/path/to/jokefile'])
    expect(@options.jokefile).to eql('/path/to/jokefile')
  end

  it "will trigger 'deploy' job" do
    @options = @cli.parse(["deploy"])
    expect(@options.job).to eql('deploy')
  end

  it "warn when more than one job is specified" do
    output = capture_stdout do 
      @options = @cli.parse(["deploy", "migrate"])
    end
    expect(output).to match(/Multiple Jobs to be executed/)
  end

end