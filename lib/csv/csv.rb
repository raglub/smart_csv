#coding: utf-8
require 'csv'

class CSV
  def self.example_data
    data = "id,firstname,lastname\n1,One,One\n2,Two,Two\n4,Four,Four\n5,Five,Five"
    CSV.parse(data, {:col_sep => ',', :headers => true})
  end
end
