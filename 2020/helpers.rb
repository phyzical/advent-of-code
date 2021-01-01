require 'awesome_print'

module Helpers
  module_function

  def read_file(file)
    File.open(file).read
  end

  def split_inputs_by_line(file_contents)
    file_contents.split("\n")
  end

  def split_inputs_by_space(file_contents)
    file_contents.split
  end
end
