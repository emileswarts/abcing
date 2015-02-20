require_relative '../lib/abcing/colour_alphabet_result.rb'

describe ABCing::ColourAlphabetResult do
  it 'finds tested class letters' do
    params = {
      test_letters: ['A', 'B'],
      app_letters: ['A', 'B']
    }

    result = ABCing::ColourAlphabetResult.new(params).calculate
    expect(result).to include(A: :green, B: :green)
  end

  it 'does not find a test for a class letter' do
    params = {
      test_letters: ['A'],
      app_letters: ['A', 'B']
    }

    result = ABCing::ColourAlphabetResult.new(params).calculate
    expect(result).to include(A: :green, B: :red)
  end
end
