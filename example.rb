require_relative "faker_gen"

puts FG::Obj.types

data1 = FG::generate do
  prop 'owner'
  prop 'ceo', :person_name
  prop 'company', :company_name
  prop 'address', :address
  prop 'phone', :phone
end

puts data1

data2 = FG::generate 3 do
  prop 'name'
  prop 'image', 'http://lorempixel.com/124/124'
  prop 'size', 10
  prop 'ok', :lorem_paragraph
end

puts data2

# = Save to file
# File.open('output.json', 'w') do |f|
#   f << data
# end
