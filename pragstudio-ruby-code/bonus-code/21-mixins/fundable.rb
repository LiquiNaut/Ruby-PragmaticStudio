module Fundable
  def remove_funds
    @funding -= 15
    puts "#{@name} lost some funds!"
  end
  
  def add_funds
    @funding += 25
    puts "#{@name} got more funds!"
  end
  
  def total_funding_outstanding
    @target - total_funds
  end
  
  def fully_funded?
    total_funding_outstanding <= 0
  end
end