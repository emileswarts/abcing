module ABCing
  class ClassFileFinder
    def initialize(directories = ['.'])
      @target_directories = directories
    end

    def find
      directory_files.uniq.flatten.sort
    end

    private

    def directory_files
      @target_directories.collect { |d| files_for_directory(d) }
    end

    def files_for_directory(directory)
      Dir["#{directory}/**/*.rb"]
    end
  end
end
