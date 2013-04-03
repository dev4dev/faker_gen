require "faker"
require "json"

module FG
  class Obj
    @@types = {
      :person_name => ->{Faker::Name.name},
      
      :company_name => ->{Faker::Company.name},
      :company_slogan => ->{Faker::Company.catch_phrase},
      
      :address => ->{Faker::Address.street_address(true)},
      :address_country => ->{Faker::Address.country},
      :address_city => ->{Faker::Address.city},
      :address_zip => ->{Faker::Address.zip_code},
      :address_street => ->{Faker::Address.street_name},
      
      :phone => ->{Faker::PhoneNumber.phone_number},
      
      :internet_domain => ->{Faker::Internet.domain_name},
      :internet_email => ->{Faker::Internet.email},
      :internet_ip4 => ->{Faker::Internet.ip_v4_address},
      :internet_ip6 => ->{Faker::Internet.ip_v6_address},
      :internet_url => ->{Faker::Internet.url},
      :internet_username => ->{Faker::Internet.user_name},
      
      :lorem_word => ->{Faker::Lorem.word},
      :lorem_sentence => ->{Faker::Lorem.sentence},
      :lorem_paragraph => ->{Faker::Lorem.paragraph},
    }
    
    def initialize &block
      @props = {}
      instance_eval &block
    end
    
    def prop name, type = :person_name
      @props[name] = !@@types[type].nil? ? @@types[type] : type
    end
    
    def self.types
      @@types.keys
    end
    
    def to_json *a
      data = {}
      @props.each do |name, type|
        data[name] = type.is_a?(Proc) ? type[] : type
      end
      data.to_json(*a)
    end
    
    def generate count
      data = Array.new count, self
      JSON.pretty_generate(data)
    end
  end
  
  def self.generate count = 10, &block
    o = Obj.new &block
    o.generate count
  end
end
