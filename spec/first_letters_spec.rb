require 'spec_helper'
require_relative '../lib/abcing/first_letters'

describe ABCing::FirstLetters do
  it 'collects 2 letters' do
    matcher = ABCing::FirstLetters.new ['Bar', 'Foo']
    expect(matcher.letters).to eq(['B', 'F'])
  end

  it 'Only collects unique letters' do
    matcher = ABCing::FirstLetters.new(['Zoo', 'Zebra'])
    expect(matcher.letters).to eq(['Z'])
  end

  it 'Orders letter results alphabetically' do
    matcher = ABCing::FirstLetters.new(['Cobra', 'Acid', 'Bee'])
    expect(matcher.letters).to eq(['A', 'B', 'C'])
  end

  it 'Returns an empty result' do
    matcher = ABCing::FirstLetters.new([])
    expect(matcher.letters).to eq([])
  end
end
