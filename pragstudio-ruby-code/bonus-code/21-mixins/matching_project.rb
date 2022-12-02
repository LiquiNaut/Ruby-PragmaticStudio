require_relative 'project'

class MatchingProject < Project
  
  def initialize(name, target_funding_amount, funding=0)
    super(name, target_funding_amount, funding)
    @halfway_funded = target_funding_amount / 2
  end
  
  def halfway_funded?
    @halfway_funded <= funding
  end
  
  def add_funds
    if halfway_funded?
      @funding += (25*2)
      puts "#{@name} has received at least half its funding!" if halfway_funded?
    else
      super
    end
  end
  
end

if __FILE__ == $0
  matchingproject = MatchingProject.new("Matching 123", 100, 0)
  3.times { matchingproject.add_funds }
  puts matchingproject.funding
end

