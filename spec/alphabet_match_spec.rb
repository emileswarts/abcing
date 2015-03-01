require 'spec_helper'
require_relative '../lib/abcing/alphabet_match'

describe ABCing::AlphabetMatch do
  it 'collects 2 letters' do
    matcher = ABCing::AlphabetMatch.new ['Bar', 'Foo']
    expect(matcher.letters).to eq(['B', 'F'])
  end

  it 'Only collects unique letters' do
    matcher = ABCing::AlphabetMatch.new(['Zoo', 'Zebra'])
    expect(matcher.letters).to eq(['Z'])
  end

  it 'Orders letter results alphabetically' do
    matcher = ABCing::AlphabetMatch.new(['Cobra', 'Acid', 'Bee'])
    expect(matcher.letters).to eq(['A', 'B', 'C'])
  end
end
