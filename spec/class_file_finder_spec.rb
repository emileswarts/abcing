require 'fileutils'
require 'spec_helper'
require 'abcing/class_file_finder'

describe ABCing::ClassFileFinder do
  before(:each) do
    Dir.mkdir 'dummy'

    ['foo', 'bar'].each do |name|
      out_file = File.new("dummy/#{ name }.rb", 'w')
      out_file.puts("class #{ name.upcase }; end;")
      out_file.close
    end
  end

  let(:expected_results) { ['dummy/bar.rb', 'dummy/foo.rb'] }

  after(:each) do
    FileUtils.rm_rf 'dummy'
  end

  context 'Included files' do
    it 'Finds files with class defined in them' do
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
