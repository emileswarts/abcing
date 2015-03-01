require 'spec_helper'
require_relative '../lib/abcing/scanner.rb'

describe ABCing::Scanner do
  let(:empty_params) do
    { app_directories: [], test_directories: [] }
  end

  before(:each) do
    FileUtils.rm_rf 'dummy'
    Dir.mkdir 'dummy'
    Dir.mkdir 'dummy/lib'
    Dir.mkdir 'dummy/spec'
  end

  after(:each) do
    FileUtils.rm_rf 'dummy'
  end

  it 'scans' do
    create_app_files(['foo'])
    create_test_files(['foo'])

    params = {
      app_directories: ['dummy/lib'],
      test_directories: ['dummy/spec']
    }

    results = ABCing::Scanner.new(params).results

    expected_results = {
      test_letter_matches: ['F'],
      app_letter_matches: ['F']
    }

    expect(results).to eq(expected_results)
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
