require_relative 'pledge_pool'

describe Pledge do
  
  before do
    @pledge = Pledge.new(:bronze, 50)
  end
  
  it "has a name attribute" do
    @pledge.name.should == :bronze
  end
  
  it "has an amount attribute" do
    @pledge.amount.should == 50
  end
  
end

describe PledgePool do
  
  it "has three pledges" do
    PledgePool::PLEDGES.size.should == 3
  end
  
  it "has a bronze pledge worth $50" do
    PledgePool::PLEDGES[0].should == Pledge.new(:bronze, 50)
  end
  
  it "has a silver pledge worth 75 points" do
    PledgePool::PLEDGES[1].should == Pledge.new(:silver, 75)
  end
  
  it "has a gold pledge worth 100 points" do
    PledgePool::PLEDGES[2].should == Pledge.new(:gold, 100)
  end
  
  it "returns a random pledge" do
    pledge = PledgePool.random
    
    PledgePool::PLEDGES.should include(pledge)
  end

end
