require_relative "faker_gen"

data1 = FG::generate do
  prop 'owner'
  prop 'ceo', :person_name
  prop 'company', :company_name
end

puts data1

data2 = FG::generate 3 do
  prop 'name'
end

puts data2

# = Save to file
# File.open('output.json', 'w') do |f|
#   f << data
# end
