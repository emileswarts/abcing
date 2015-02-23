require_relative '../lib/abcing/scanner.rb'

describe ABCing::Scanner do
  it 'scans' do
    params = { app_directories: [], test_directories: [] }
    scanner = ABCing::Scanner.new(params)
  end

  context 'Does not scan' do
    it 'raises an error when supplied with nil params' do
      expect { ABCing::Scanner.new(nil) }.to raise_error()
    end
  end
end
