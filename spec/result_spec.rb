require_relative '../lib/abcing/result.rb'

describe ABCing::Result do
  it 'prepares a colourful result' do
    params = {
      test_letters: ['A', 'B'],
      app_letters: ['A', 'B']
    }

    result = ABCing::Result.new(params).calculate
    expect(result).to include(A: :green, B: :green)
  end
end
