require_relative '../lib/abcing/renderer'

describe ABCing::Renderer do
  it '#render' do
    ABCing::Renderer.new.render
  end
end
