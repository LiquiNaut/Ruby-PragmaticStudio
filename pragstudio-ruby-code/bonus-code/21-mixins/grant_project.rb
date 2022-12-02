require_relative 'project'

class GrantProject < Project
  def remove_funds
    @funding -= 0
    puts "#{@name} has not lost or gained any new funds."
  end
end






if __FILE__ == $0
  grant = GrantProject.new("Project123", 500, 100)
  
  puts "#{grant.name} has $#{grant.total_funds} in funding towards a goal of $#{grant.target}."
  grant.remove_funds
  puts "#{grant.name} has $#{grant.total_funds} in funding towards a goal of $#{grant.target}."
end
