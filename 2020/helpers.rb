require "awesome_print"
require "byebug"

module Helpers
  module_function

  def read_file(file)
    File.read(file)
  end

  def split_inputs_by_line(file_contents)
    file_contents.split("\n")
  end

  def split_inputs_by_space(file_contents)
    file_contents.split
  end

  def print_grid(array)
    ap array[0].reduce("") { |acc, _x| "#{acc}----" }
    array.each { |o| ap "| #{o.join(' | ')} |" }
    ap array[0].reduce("") { |acc, _x| "#{acc}----" }
  end
end
