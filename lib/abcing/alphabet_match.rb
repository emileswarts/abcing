module ABCing
  class AlphabetMatch
    def initialize(class_names)
      @class_names = class_names
    end

    def letters
      class_letters.flatten.sort.uniq
    end

    private

    def class_letters
      @class_names.map { |c| c[0] }
    end
  end
end
