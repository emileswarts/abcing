module ABCing
  class ClassFileFinder
    def initialize(directories = ['.'])
      @target_directories = directories
    end

    def find
      @target_directories.collect { |d| files_for_directory(d) }.flatten.sort
    end

    private

    def files_for_directory(directory)
      Dir["#{directory}/**/*.rb"]
    end
  end
end
