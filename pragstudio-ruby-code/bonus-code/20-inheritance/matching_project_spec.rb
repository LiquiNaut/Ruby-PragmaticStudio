require_relative 'matching_project'

describe MatchingProject do
  before do
    @initial_funds = 0
    @project = MatchingProject.new("Match 123", 200, @initial_funds)
  end
  
  it "does not match additional funds when the project is not halfway funded" do
    3.times { @project.add_funds }
     
    @project.halfway_funded?.should be_false
  end
  
  it "is halfway funded when it has received half of its target funding amount" do
    4.times { @project.add_funds }
     
    @project.halfway_funded?.should be_true
  end
  
  it "receives twice as much added funds when it is halfway funded" do
    7.times { @project.add_funds }
    
    @project.funding.should == @initial_funds + (4 * 25) + (3 * 25 * 2)
  end  
end
  