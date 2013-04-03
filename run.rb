require_relative "faker_gen"

data1 = FG::generate do
  prop 'owner'
  prop 'ceo', :person_name
  prop 'company', :company_name
end

puts data1

data2 = FG::generate 3 do
  prop 'name'
  prop 'image', 'http://lorempixel.com/124/124'
  prop 'size', 10
end

puts data2

# = Save to file
# File.open('output.json', 'w') do |f|
#   f << data
# end
