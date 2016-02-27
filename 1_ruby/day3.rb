# Day 3 : Serious Change

module ActsAsCsv
  class CsvRow
    def initialize(csv, content)
      @csv = csv
      @contents = content
    end

    #catch missing method and access array of content in proper position
    def method_missing(name)
      index = @csv.headers.index(name.to_s)
      if index
        @contents[index]
      else
        '!!incorrect accessor!!'
      end
    end
  end

  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end

  module InstanceMethods

    def read
      @csv_contents = []
      filename = self.class.to_s.downcase + '.txt'
      file = File.new(filename)
      @headers = file.gets.chomp.split(',')
      file.each do |row|
        @csv_contents << row.chomp.split(',')
      end
    end

    def each(&block)
      csv_contents.each do |contents|
        block.call(CsvRow.new(self, contents))
      end
    end

    attr_accessor :headers, :csv_contents

    def initialize
      read
    end
  end
end

class RubyCsv
  include ActsAsCsv
  acts_as_csv
end

m = RubyCsv.new

puts m.headers.inspect
puts m.csv_contents.inspect

m.each {|row| puts row.name + ' is in ' + row.counry}
m.each {|row| puts row.name + ' is in ' + row.country}