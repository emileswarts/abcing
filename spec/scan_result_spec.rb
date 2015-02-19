require_relative '../lib/abcing/scanner.rb'

describe ABCing::Scanner do
  it 'scans' do
    params = { app_directories: [], test_directories: [] }
    scanner = ABCing::Scanner.new(params)
  end
end
