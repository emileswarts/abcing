
require_relative '../lib/abcing/alphabet_match'

describe ABCing::AlphabetMatch do
  before(:each) do
    Dir.mkdir 'dummy'
  end

  after(:each) do
    FileUtils.rm_rf 'dummy'
  end

  it 'collects 2 letters' do
    class_names = ['Bar', 'Foo']
    matcher = ABCing::AlphabetMatch.new(class_names)

    expect(matcher.letters).to eq(['B', 'F'])
  end

  it 'Only collects unique letters' do
    class_names = ['Zoo', 'Zebra']

    matcher = ABCing::AlphabetMatch.new(class_names)

    expect(matcher.letters).to eq(['Z'])
  end

  it 'Orders letter results alphabetically' do
    class_names = ['Cobra', 'Acid', 'Bee']

    matcher = ABCing::AlphabetMatch.new(class_names)

    expect(matcher.letters).to eq(['A', 'B', 'C'])
  end
end
