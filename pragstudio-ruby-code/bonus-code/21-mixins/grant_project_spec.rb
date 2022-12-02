require_relative 'grant_project'

describe GrantProject do
  before do
    @initial_funds = 1000
    @project = GrantProject.new("Grant123", 5000, @initial_funds)
  end
  
  it "does not ever have funds removed" do
    @project.add_funds
    @project.remove_funds
    @project.funding.should == @initial_funds + 25
  end
end
    