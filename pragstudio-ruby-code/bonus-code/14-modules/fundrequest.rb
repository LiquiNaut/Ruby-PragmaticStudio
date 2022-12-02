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
  
  def request_funding
    puts "There are #{@projects.size} projects that you could fund:"
    @projects.each do |project|
      puts project
    end
    @projects.each do |project|
      FundingRound.one_round(project)
      puts project
    end
  end
end