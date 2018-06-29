class Table
  attr_reader :table_name, :collections

  def initialize(name, *amounts)
    @table_name = name
    @collections = amounts.map(&:to_i)
  end

  def max_collection
    max_amount = 0
    max_day = ''

    collections.each_with_index do |amount, index|
      if index.zero?
        max_amount = amount
        max_day = 'Dia 1'
      elsif index > 0 && amount > max_amount
        max_amount = amount
        max_day = "Dia #{index + 1}"
      end
    end

    return [max_amount, max_day]
  end

  def average
    sum = collections.inject(&:+)
    average = sum / collections.length.to_f
  end


  def Table.build(file_name)

    tables = []
    file = File.open(file_name, 'r')
    data = file.readlines

    data.each do |line|
      line_array = line.chomp.split(', ')
      table_name = line_array.shift
      amounts_array = line_array
      tables << Table.new(table_name, *amounts_array)
    end

    file.close
    tables

  end

  tables = Table.build('casino.txt')
  print tables
  puts ''


  puts ''
  tables.each do |table|
    puts "La #{table.table_name} tiene máxima recaudación de #{table.max_collection[0]} el #{table.max_collection[1]}"
  end

  puts ''
  tables.each do |table|
    puts "La #{table.table_name} tiene promedio #{table.average}"
  end



end
