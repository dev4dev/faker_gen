require "faker"
require "json"

module FG
  class Obj
    def initialize &block
      @types = {
        :person_name => ->{Faker::Name.name},
        :company_name => ->{Faker::Company.name}
      }
      @props = {}
      instance_eval &block
    end
  
    def prop name, type = :person_name
      @props[name] = @types[type]
    end
  
    def to_json *a
      data = {}
      @props.each do |name, type|
        data[name] = type[] unless type.nil?
      end
      data.to_json(*a)
    end
  
    def generate count
      data = []
      count.times do
        data << self
      end
      return JSON.pretty_generate(data)
    end
  end
  
  def self.generate count = 10, &block
    o = Obj.new &block
    o.generate count
  end
end
