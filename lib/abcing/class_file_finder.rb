module ABCing
  class ClassFileFinder
    def initialize(directories = ['.'])
      @target_directories = directories
    end

    def find
      @target_directories.collect do |dir|
        matching_files(dir)
      end.flatten.sort
    end

    private

    def matching_files(directory)
      files_for_directory(directory).select do |f|
        is_class_file? f
      end
    end

    def is_class_file?(file)
      File.read(file).include?('class ')
    end

    def files_for_directory(directory)
      Dir["#{directory}/**/*.rb"]
    end
  end
end
