require_relative '../lib/abcing/class_name_finder.rb'

describe ABCing::ClassNameFinder do
  it 'produces class names from string input' do
    content = 'class Something; end'
    finder = ABCing::ClassNameFinder.new(content)
    expect(finder.find).to eq(['Something'])
  end
end
