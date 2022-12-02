require_relative 'grant_project'

describe GrantProject do
  before do
    @initial_funds = 1000
    @project = GrantProject.new("Grant 123", 5000, @initial_funds)
  end
  
  it "does not ever have funds removed" do
    @project.remove_funds
    @project.funding.should == @initial_funds
  end
end
    