require 'spec_helper'

describe Jokefile do

  before :each do
    Jokefile.instance_eval do 
      @job_manager = nil
    end
  end
  
  context "simple jobs without dependencies" do 
    
    it "register one job" do 
      manager = Jokefile.load(FixtureRegistry[:one_task])
      expect(manager.jobs.keys.length).to eq(1)
      expect(manager.jobs.keys).to eq(["testing"])
    end

    it "register one job without dependency" do 
      manager = Jokefile.load(FixtureRegistry[:one_task])
      expect(manager.jobs["testing"].dependencies).to be(nil)
    end


    it "register two jobs" do 
      manager = Jokefile.load(FixtureRegistry[:two_tasks])
      expect(manager.jobs.keys.length).to eq(2)
      expect(manager.jobs.keys).to include("first", "second")
      expect(manager.jobs["first"].dependencies).to be(nil)
      expect(manager.jobs["second"].dependencies).to be(nil)

    end

  end


  context "simple jobs with dependencies" do

    it "register 3 jobs" do 
      manager = Jokefile.load(FixtureRegistry[:deploy])
      expect(manager.jobs.keys.length).to eq(3)
      expect(manager.jobs.keys).to include("deploy", "migrate", "environment")
    end


    it "register jobs dependencies" do 
      manager = Jokefile.load(FixtureRegistry[:deploy])
      deploy_job= manager.jobs["deploy"]
      migrate_job = manager.jobs["migrate"]
      environment_job = manager.jobs["environment"]

      expect(deploy_job.dependencies).to eq("migrate")
      expect(migrate_job.dependencies).to eq("environment")
      expect(environment_job.dependencies).to_not be
    end

    it "execute in the properly order" do 
      manager = Jokefile.load(FixtureRegistry[:deploy])
      
      deploy_job= manager.jobs["deploy"]
      migrate_job = manager.jobs["migrate"]
      environment_job = manager.jobs["environment"]

      environment_job.should_receive(:execute) do
        migrate_job.should_receive(:execute) do 
          deploy_job.should_receive(:execute)
        end
      end

      manager.execute("deploy")
    end

  end

  context "cyclic jobs" do 
    
    it "detects cyclic" do
      manager = Jokefile.load(FixtureRegistry[:self_cyclic])
      expect{ manager.execute("migrate")}.to raise_error(JobsManager::CyclicDetectedError)
    end

  end

end