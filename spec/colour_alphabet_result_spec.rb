require_relative '../lib/abcing/colour_alphabet_result.rb'

describe ABCing::ColourAlphabetResult do
  it 'prepares a colourful result' do
    params = {
      test_letters: ['A', 'B'],
      app_letters: ['A', 'B']
    }

    result = ABCing::ColourAlphabetResult.new(params).calculate
    expect(result).to include(A: :green, B: :green)
  end
  it 'prepares a colourful result' do
    params = {
      test_letters: ['A', 'B'],
      app_letters: ['A', 'B']
    }

    result = ABCing::ColourAlphabetResult.new(params).calculate
    expect(result).to include(A: :green, B: :green)
  end
end
