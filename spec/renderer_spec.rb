require_relative '../lib/abcing/renderer'
require_relative '../lib/monkey_patch/string'
require 'spec_helper'

describe ABCing::Renderer do
    let(:yellow) { "\e[33m%s\e[0m" }
    let(:red) { "\e[31m%s\e[0m" }
    let(:green) { "\e[32m%s\e[0m" }

  context 'render' do
    it 'renders all yellow results' do
      expected_output = ('A'..'Z').map { |l| sprintf(yellow, l) }.join(' ')

      expect(STDOUT).to receive(:puts).with expected_output

      scan_results = {
        test_letter_matches: [],
        app_letter_matches: []
      }

      ABCing::Renderer.new(scan_results).render
    end

    it 'renders all red results' do
      expected_output = ('A'..'Z').map { |l| sprintf(red, l) }.join(' ')

      expect(STDOUT).to receive(:puts).with expected_output

      scan_results = {
        test_letter_matches: [],
        app_letter_matches: ('A'..'Z')
      }

      ABCing::Renderer.new(scan_results).render
    end

    it 'renders all green results' do
      expected_output = ('A'..'Z').map { |l| sprintf(green, l) }.join(' ')

      expect(STDOUT).to receive(:puts).with expected_output

      scan_results = {
        test_letter_matches: ('A'..'Z'),
        app_letter_matches: ('A'..'Z')
      }

      ABCing::Renderer.new(scan_results).render
    end
  end
end
