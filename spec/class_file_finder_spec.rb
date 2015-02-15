require 'abcing/class_file_finder'

describe ABCing::ClassFileFinder do
  it '#render' do
    ABCing::ClassFileFinder.new.find
  end
end
