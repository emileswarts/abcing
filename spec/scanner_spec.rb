require_relative '../lib/abcing/scanner.rb'
require 'spec_helper'

describe ABCing::Scanner do
  let(:empty_params) do
    { app_directories: [], test_directories: [] }
  end

  it 'scans' do
    scanner = ABCing::Scanner.new(empty_params).results
  end

  context 'Raises an error' do
    it 'when supplied with nil params' do
      expect { ABCing::Scanner.new(nil) }.to raise_error()
    end

    it 'when supplied incomplete data' do
      empty_params.delete(:app_directories)
      expect { ABCing::Scanner.new(empty_params) }.to raise_error()

      empty_params.delete(:test_directories)
      expect { ABCing::Scanner.new(empty_params) }.to raise_error()
    end
  end
end
