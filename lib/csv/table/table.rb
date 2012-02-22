#coding: utf-8
require 'csv'
class CSV::Table

  def where_not(*conditions)
    result = CSV::Table.new([])
    self.each do |record|
      counter = 0
      conditions.first.each {|key, value| counter += 1 unless record[key] == value.to_s}
      result << record if counter == conditions.size
    end
    result
  end

  def where(*conditions)
    result = CSV::Table.new([])
    self.each do |record|
      counter = 0
      conditions.first.each {|key, value| counter += 1 if record[key] == value.to_s}
      result << record if counter == conditions.size
    end
    result
  end

  def create(*conditions)
    headers = self.headers
    row = headers.inject({}){|result, value| result[value] = nil; result}
    conditions.first.each do |key, value|
      raise "In headers: '#{headers}' don't have key: '#{key}'" unless headers.include?(key)
      row[key] = value
    end
    values = headers.inject([]) {|result, key| result << row[key]; result}
    record = CSV::Row.new(headers, values)
    self << record
    record
  rescue Exception => e
    puts "#{self.class}  #{e.message}"
  end

  # Delete all record of table
  def delete_all
    while not self.empty?    
      self.delete(0)
    end
  end

end
