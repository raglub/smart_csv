#coding: utf-8
require 'csv'
class CSV::Table

  attr_accessor :ancestor

  def where_not(*conditions)
    result = CSV::Table.new([])
    self.each do |record|
      counter = 0
      conditions.first.each {|key, value| counter += 1 unless record[key] == value.to_s}
      result.table << record if counter == conditions.size
    end
    result
  end

  def where(*conditions)
    result = CSV::Table.new([])
    result.ancestor = self.ancestor || self

    self.each do |record|
      counter = 0
      conditions.first.each {|key, value| counter += 1 if record[key] == value.to_s}
      result << record if counter == conditions.size
    end
    result
  end

  [
    [:lt, :<],
    [:le, :<=],
    [:gt, :>],
    [:ge, :>=],
  ].each do |name, operator|
    define_method name do |attribute, value|
      result = prepare_new_table

      self.each do |record|
        result << record if record[attribute].to_f.send(operator, value)
      end

      result
    end
  end

  [
    [:eq, :==],
    [:ne, '!=']
  ].each do |name, operator|
    define_method name do |attribute, value|
      result = prepare_new_table

      self.each do |record|
        result << record if record[attribute].send(operator, value)
      end

      result
    end
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

  # Delete all record of ancestor table
  # it works with method #where
  def delete_all
    if self.ancestor
      self.table.each do |row|
        self.ancestor.table.delete(row)
      end
    else
      while not self.empty?
        self.delete(0)
      end
    end
  end

  private

    def prepare_new_table
      result = CSV::Table.new([])
      result.ancestor = self.ancestor || self
      result
    end

end
