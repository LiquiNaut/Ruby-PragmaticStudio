require_relative 'project'
require_relative 'fundrequest'

project1 = Project.new("Project ABC", 5000, 1000)
project2 = Project.new("Project LMN", 3000, 500)
project3 = Project.new("Project XYZ", 75, 25)

projects = FundRequest.new("VC-Friendly Start-up Projects")
projects.load_projects(ARGV.shift || "projects.csv")

loop do
  puts "\nHow many rounds of funding? ('quit' to exit)"
  answer = gets.chomp.downcase
  case answer
  when /^\d+$/
    projects.request_funding(answer.to_i)
  when 'quit', 'exit'
    projects.print_results
    break
  else
    puts "Please enter a number or 'quit'"
  end
end

projects.save_under_funded_projects

