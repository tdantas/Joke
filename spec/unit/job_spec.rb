require 'spec_helper'

describe Job do
  
  context "without any dependencies" do 
    
    it "with name only" do
      job = Job.new('deploy')
      expect(job.name).to eql('deploy')
    end

    it "with command name and command only" do 
      expected = []
      job = Job.new('deploy') do 
        expected << 'expected_value'
      end

      job.command.call
      expect(expected[0]).to eql('expected_value')
    end
  end

  context "with dependencies" do 

    it "register one dependency" do
      job = Job.new('deploy', 'environment')
      expect(job.dependencies).to eql('environment')
    end
  
  end
end