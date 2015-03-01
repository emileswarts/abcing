require_relative '../lib/abcing/letter_finder.rb'

describe ABCing::LetterFinder do
  it 'scans' do
    params = { app_directories: [], test_directories: [] }
    ABCing::LetterFinder.new(params)
  end

  context 'Raises an error' do
    it 'when supplied with nil params' do
      expect { ABCing::LetterFinder.new(nil) }.to raise_error()
    end
  end
end
