require_relative 'project'
require_relative 'funding_round'
require_relative 'pledge_pool'

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
    
    pledges = PledgePool::PLEDGES
    puts "\nThere are #{pledges.size} possible pledge amounts:"
    pledges.each do |pledge|
      puts "A #{pledge.name} pledge is worth $#{pledge.amount}."
    end
    
    1.upto(rounds) do |round|
      puts "\nFunding Round #{round}:"
        @projects.each do |project|
        FundingRound.one_round(project)
        puts project
      end
    end  
  end
  
  def print_name(project)
    puts "#{project.name}"
  end
  
  def fully_funded_projects
    @projects.select { |project| project.fully_funded? }
  end
  
  def under_funded_projects
    @projects.reject { |project| project.fully_funded? }
  end
  
  def print_results
    puts "\n#{fully_funded_projects.size} Fully Funded Projects:"
    fully_funded_projects.each do |project|
      print_name(project)
    end    
    
    puts "\n#{under_funded_projects.size} Under Funded Projects:"
    under_funded_projects.each do |project|
      print_name(project)
    end
      
    puts "\n#{under_funded_projects.size} projects still need your help:"
    sorted_under_funded_projects.each do |project|
      formatted_name = project.name.ljust(20, '.')
      puts "#{formatted_name} $#{project.total_funding_outstanding} under"
    end
    
    @projects.each do |project|
      puts "\n#{project.name}'s pledges:"
        project.each_received_pledge do |pledge|
          puts "$#{pledge.amount} in #{pledge.name} pledges"
        end
        puts "$#{project.pledges} in total pledges"
      end
  end
  
  def sorted_under_funded_projects
    under_funded_projects.sort { |a, b| b.total_funding_outstanding <=> a.total_funding_outstanding}
  end

  
  def load_projects(from_file)
    File.readlines(from_file).each do |line|
      name, target_funding_amount, funding = line.split(',')
      project = Project.new(name, Integer(target_funding_amount), Integer(funding))
      add_project(project)
    end
  end
  
  def save_under_funded_projects(to_file="needmoremoney.txt")
    File.open(to_file, "w") do |file|
      file.puts "These projects still need your help:"
      sorted_under_funded_projects.each do |project|
        formatted_name = project.name.ljust(20, '.')
        file.puts "#{formatted_name} $#{project.total_funding_outstanding} under"
      end
    end
  end
    
end