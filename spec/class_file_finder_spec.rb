require 'fileutils'
require 'spec_helper'
require 'abcing/class_file_finder'

describe ABCing::ClassFileFinder do
  before(:each) do
    Dir.mkdir 'dummy'
    Dir.mkdir 'dummy/lib'

    create_app_files(['foo', 'bar'])
  end

  let(:expected_results) { ['dummy/lib/bar.rb', 'dummy/lib/foo.rb'] }

  after(:each) do
    FileUtils.rm_rf 'dummy'
  end

  context 'Included files' do
    it 'Finds files with class defined in them' do
      finder = ABCing::ClassFileFinder.new(['dummy'])
      expect(finder.find).to eq(expected_results)
    end

    it 'Sorts found class names' do
      create_app_files(['zzz', 'aaa'])
      finder = ABCing::ClassFileFinder.new(['dummy'])
      expected_results = [
        'dummy/lib/aaa.rb',
        'dummy/lib/bar.rb',
        'dummy/lib/foo.rb',
        'dummy/lib/zzz.rb'
      ]
      expect(finder.find).to eq(expected_results)
    end

    it 'Only tracks unique files' do
      create_app_files(['foo'])
      finder = ABCing::ClassFileFinder.new(['dummy'])

      expect(finder.find).to eq(expected_results)
    end
  end

  context 'Excluded files' do
    it 'that do not have a .rb extension' do
      out_file = File.new('dummy/foo_config.txt', 'w')
      out_file.puts('class FooConfig; end;')
      out_file.close

      finder = ABCing::ClassFileFinder.new(['dummy'])
      expect(finder.find).to eq(expected_results)
    end
  end
end
