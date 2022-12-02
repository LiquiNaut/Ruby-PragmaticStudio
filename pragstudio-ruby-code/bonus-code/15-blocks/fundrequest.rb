require_relative 'project'
require_relative 'die'
require_relative 'funding_round'

class FundRequest
  
  attr_reader :title
  
  def initialize(title)
    @title = title
    @projects = []
  end
  
  def add_project(a_project)
    @projects.push(a_project)
  end
  
  def request_funding(rounds)
    puts "There are #{@projects.size} projects that you could fund:"
    
    @projects.each do |project|
      puts project
    end
    
    1.upto(rounds) do |round|
      puts "\nFunding Round #{round}:"
        @projects.each do |project|
        FundingRound.one_round(project)
        puts project
      end
    end  
  end
  
  def print_name_and_funding(project)
    puts "#{project.name} ($#{project.funding})"
  end
  
  def print_results
    fully_funded_projects = @projects.select { |project| project.fully_funded? }
    under_funded_projects = @projects.reject { |project| project.fully_funded? }
    
    puts "\n#{fully_funded_projects.size} Fully-funded Projects:"
    fully_funded_projects.each do |project|
      print_name_and_funding(project)
    end    
    
    puts "\n#{under_funded_projects.size} Under-funded Projects:"
    under_funded_projects.each do |project|
      print_name_and_funding(project)
    end
    
    sorted_projects = under_funded_projects.sort { |a, b| b.total_funding_outstanding <=> a.total_funding_outstanding}
    
    puts "\n#{under_funded_projects.size} projects still need your help:"
    sorted_projects.each do |project|
      formatted_name = project.name.ljust(20, '.')
      puts "#{formatted_name} $#{project.total_funding_outstanding} under"
    end
  end
  
end