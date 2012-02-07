#coding: utf-8
require 'csv'
class CSV::Row
  def update(conditions)
    conditions.each do |key, value|
      raise "In headers: '#{self.headers}' don't have key: '#{key}'" unless self.include?(key)
      self[key] = value
    end
  rescue Exception => e
    puts "#{self.class}  #{e.message}"
  end
end
