require_relative 'fundrequest'

describe FundRequest do

  before do
    @fundrequest = FundRequest.new("VC-Friendly Start-up Projects")
    
    @initial_funds = 1000
    @project = Project.new("Project ABC", 5000, @initial_funds)
    
    @fundrequest.add_project(@project)
  end
  
  it "adds funds to a project if an even number is rolled" do
    Die.any_instance.stub(:roll).and_return(4)
    
    @fundrequest.request_funding(2)
    
    @project.funding.should == @initial_funds + (25 * 2)
  end
  
  it "removes funds to a project if an odd number is rolled" do
    Die.any_instance.stub(:roll).and_return(3)
    
    @fundrequest.request_funding(2)
    
    @project.funding.should == @initial_funds - (15 * 2)
  end
  
end