require 'fileutils'
require 'abcing/class_file_finder'

describe ABCing::ClassFileFinder do
  before(:each) do
    Dir.mkdir 'dummy'

    ['foo', 'bar'].each do |name|
      File.write("dummy/#{ name }.rb", '')
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
      File.write('dummy/foo_config.txt', '')

      finder = ABCing::ClassFileFinder.new(['dummy'])
      expect(finder.find).to eq(expected_results)
    end
  end
end
