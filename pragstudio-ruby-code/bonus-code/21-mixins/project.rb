require_relative 'pledge_pool'
require_relative 'fundable'

class Project
  include Fundable

  attr_accessor :name
  attr_reader :funding, :target

  def initialize(name, target_funding_amount, funding=0)
    @name = name
    @target = target_funding_amount
    @funding = funding
    @received_pledge = Hash.new(0)
  end
  
  def to_s
    "#{@name} has $#{total_funds} in funding towards a goal of $#{@target}." 
  end
  
  def received_pledge(pledge)
    @received_pledge[pledge.name] += pledge.amount
    puts "#{@name} received a #{pledge.name} pledge worth $#{pledge.amount}."
    puts "#{@name}'s pledges: #{@received_pledge}"
  end
  
  def pledges
    @received_pledge.values.reduce(0, :+)
  end
  
  def total_funds
    @funding + pledges
  end
  
  def each_received_pledge
    @received_pledge.each do |name, amount|
      yield Pledge.new(name, amount)
    end
  end
  
end

if __FILE__ == $0
  project = Project.new("Project ABC", 5000, 1000)
  puts project.name
  puts project.funding
  project.remove_funds
  puts project.funding
  project.add_funds
  puts project.funding
end