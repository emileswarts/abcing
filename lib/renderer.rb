module ABCing
  class Renderer
    def initialize
    end

    def render
      alphabet = ('a'..'z').to_a
      p alphabet.join(' ')
    end
  end
end
