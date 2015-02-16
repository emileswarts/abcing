require_relative '../lib/abcing/scanner.rb'

describe ABCing::Scanner do
  it 'renders a result' do
    params = { app_directories: [], test_directories: [] }
    scanner = ABCing::Scanner.new(params)
  end
end
